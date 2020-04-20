# frozen_string_literal: true

require "capybara_helper"

describe "Show Articles", type: :system do
  it "shows all articles" do
    visit root_path
    expect(page).to have_content "Articles"
    click_on "Add"

    fill_in "Title", with: "my suppa cool article"
    fill_in "Link", with: "https://mylink.de"
    fill_in "Title", with: "oh lala"

    click_on "Save"

    # require 'pry-nav'; binding.pry;

    # check table
    first("table").all("th").map(&:text) # => ["Titel", "Link", "Description", "Created", ""]
    first("table").all("tbody tr").map { |tr| tr.all("td").map(&:text) } # => [["oh lala", "https://mylink.de", "", "17.04.2020 15:42", " Show"]]
  end
end
