namespace :toread do
  namespace :mails do
    desc "receives emails and process it"
    task process: :environment do
      mailbox = ImapMailHandler.new logger: Logger.new(STDOUT)
      mailbox.receive_and_archive_mail do |mail|
        MailArticleCreator.new(mail: MailPresenter.new(mail)).call
      end
    end
  end
end
