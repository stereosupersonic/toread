# frozen_string_literal: true

require "capybara_helper"

describe "Show Articles", type: :system do
  it "shows all articles" do
    travel_to Time.zone.local(2004, 11, 24, 0o1, 0o4, 44) do
      visit root_path
      expect(page).to have_content "Articles"
      click_on "Add"

      fill_in "Title", with: "my suppa cool article"
      fill_in "Link", with: "https://mylink.de"
      fill_in "Title", with: "oh lala"

      click_on "Save"
      expect(page).to have_table_with_exact_data([
        ["Titel", "Link", "Description", "Created", ""],
        ["oh lala", "https://mylink.de", "", "24.11.2004 01:04", "Show"]
      ])
    end
  end
end
