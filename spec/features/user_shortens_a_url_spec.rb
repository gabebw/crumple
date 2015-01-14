require "rails_helper"

feature "User shortens a URL" do
  scenario "and sees the shortened URL" do
    visit root_path

    fill_in "link_url", with: "http://gabebw.com"
    click_on "Shorten!"

    link = Link.last
    expected_url = "http://www.example.com/l/#{link.id}"
    anchor = find("#link a")

    expect(anchor[:href]).to eq expected_url
    expect(anchor.text).to eq expected_url
  end
end
