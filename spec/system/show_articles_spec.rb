# frozen_string_literal: true

require "capybara_helper"

describe "Show Articles", type: :system do
  it "shows all articles" do
    FactoryBot.create :article, link: "https://mytestlink.de"

    visit root_path

    expect(page).to have_content("Articles")
    expect(page).to have_link("https://mytestlink.de")
    expect(page).to have_link("new article")
  end
end
