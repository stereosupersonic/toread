# frozen_string_literal: true

require "capybara_helper"

describe "Show Articles", type: :system, js: true do
  it "shows all articles" do
    travel_to Time.zone.local(2004, 11, 24, 0o1, 0o4, 44) do
      visit root_path
      expect(page).to have_content "Articles"
      click_on "Add"

      fill_in "Title", with: "my suppa cool article"
      fill_in "Link", with: "https://mylink.de"
      fill_in "Title", with: "oh lala"
      fill_in "Description", with: "some text"

      click_on "Save"
      expect(page).to have_content "Articel was successfully created."
      expect(page).to have_table_with_exact_data([
        ["Titel", "Link", "Description", "Created", ""],
        ["oh lala", "https://mylink.de", "some text", "24.11.2004 01:04", "Show"]
      ])
    end
    click_on "Show"
    expect(page).to have_content "Articel"
    expect(page).to have_content "Title: oh lala"
    expect(page).to have_content "Link: https://mylink.de"
    expect(page).to have_content "Description: some text"

    click_on "Edit"
    fill_in "Title", with: "my suppa cool article2"
    fill_in "Link", with: "https://mylink2.de"
    fill_in "Title", with: "oh lala2"
    fill_in "Description", with: "some text2"
    click_on "Save"

    expect(page).to have_content "Articel was successfully updated."
    expect(page).to have_table_with_exact_data([
      ["Titel", "Link", "Description", "Created", ""],
      ["oh lala2", "https://mylink2.de", "some text2", "24.11.2004 01:04", "Show"]
    ])

    click_on "Show"
    accept_confirm do
      click_on "Delete"
    end
    expect(page).to have_content "Articel was successfully destroyed."
    expect(page).to have_table_with_exact_data([
      ["Titel", "Link", "Description", "Created", ""]
    ])
  end
end
