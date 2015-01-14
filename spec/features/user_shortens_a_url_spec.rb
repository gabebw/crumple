require "rails_helper"

feature "User shortens a URL" do
  scenario "and sees the shortened URL" do
    visit root_path

    fill_in "link_url", with: "http://gabebw.com"
    click_on "Shorten!"

    expected_url = "http://www.example.com/1"
    expect(find("#link")).to have_content expected_url
    expect(find("#link")).to have_link expected_url
  end
end
