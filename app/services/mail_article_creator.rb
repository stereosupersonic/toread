class MailArticleCreator < BaseService
  attr_accessor :mail

  def call
    Article.create link: extract_link, title: mail.subject, created_at: mail.date
  end

  private

  def extract_link
    mail.body.to_s[/https?:\/\/[\S]+/, 0]
  end

  # log this
  # mail_doc.sender     = mail.from_addrs[0]
  # mail_doc.subject    = mail.subject # extract Fwd:
  # mail_doc.mime_type  = mail.mime_type
  # mail_doc.send_at    = mail.date
  # mail_doc.multipart  = mail.multipart?
  # mail_doc.message_id = mail.message_id
end
