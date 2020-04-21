# frozen_string_literal: true

require "net/imap"
require "net/http"
require "mail"

class ImapMailHandler
  attr_accessor :logger

  def initialize(config = {})
    @host = Rails.application.credentials.mailbox[:host]
    @user = Rails.application.credentials.mailbox[:user]
    @pw = Rails.application.credentials.mailbox[:password]
    @archive_folder = config[:archive_folder] # || "ARCHIVE"
    @inbox = "INBOX"
    @logger = config[:logger] # || Rails.logger
  end

  # usage:
  # imap_handler = ImapMailHandler.new
  # [].tap do |result|
  # imap_handler.receive_and_archive_mail(["ALL"]) do |mail|
  #   result <<  mail # "#{mail.subject}: #{mail.body.to_s[/https?:\/\/[\S]+/,0]}"
  #  end
  # end
  #
  # mail.text_part.body.decoded

  def receive_and_archive_mail(search_params = ["NOT", "SEEN"], &block)
    find_mails(search_params) do |mail|
      yield mail if block_given?
      archive_mail(mail) if @archive_folder.present?
    end
  end

  private

  def find_mails(conditions, &block)
    conditions = conditions.presence || ["ALL"]
    login
    log "search for mails with flags: #{conditions}"
    mailbox.search(conditions).each do |message_id|
      mail = fetch_mail message_id
      log "mail found with message_id: '#{message_id}' subject: #{mail.subject}"
      yield mail
    end
    logout
  end

  def fetch_mail(message_id)
    Mail.new mailbox.fetch(message_id, "RFC822")[0].attr["RFC822"]
  end

  def mailbox
    @mailbox ||= if Rails.env.development?
      Net::IMAP.new(@host, 993, true, nil, false)
    else
      Net::IMAP.new(@host)
    end
  end

  def logout
    log "close connection to mailserver"
    mailbox.expunge
    mailbox.logout
    @mailbox = nil
  end

  def login
    log "login to mailserver '#{@host}' folder: '#{@inbox}' user: '#{@user}'"
    mailbox.login(@user, @pw)
    mailbox.select(@inbox)
  end

  def archive_mail(mail)
    # create folder when not exists
    message_id = mail.message_id
    mailbox.create(@archive_folder) unless mailbox.list(@archive_folder, "%")
    mailbox.copy(message_id, @archive_folder)
    log "archive mail '#{message_id}' to '#{@archive_folder}'"
    mailbox.store(message_id, "+FLAGS", [:Deleted])
  end

  def log(msg)
    @logger&.debug msg
  end
end
