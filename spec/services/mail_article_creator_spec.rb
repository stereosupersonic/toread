require "rails_helper"
require "mail"

RSpec.describe MailArticleCreator, type: :model do
  it "genrates a new valid article" do
    mail = Mail.read Rails.root.join("spec", "fixtures", "emails", "multipart_1.eml")

    mail_presenter = MailPresenter.new mail
    expect { MailArticleCreator.new(mail: mail_presenter).call }.to change { Article.count }.by(1)

    articel = Article.last
    expect(articel.title).to eq "ZITATFORSCHUNG: \"Nur die allerdümmsten Kälber wählen ihren Schlächter selber.\" Bertolt Brecht (angeblich)"
    expect(articel.link).to eq "http://falschzitate.blogspot.com/2018/04/nur-die-allerdummsten-kalber-wahlen.html"
  end
end
