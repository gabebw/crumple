require "rails_helper"

feature "User shortens a URL" do
  scenario "and sees the shortened URL" do
    visit root_path

    fill_in "link_url", with: "http://gabebw.com"
    click_on "Shorten!"

    expect(find("#link")).to have_content "http://www.example.com/1"
  end
end
