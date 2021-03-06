require "rails_helper"

feature "User shortens a URL" do
  scenario "and sees the shortened URL" do
    visit root_path

    fill_in "link_url", with: "http://gabebw.com"
    click_on "Shorten!"

    link = Link.last
    expected_url = redirect_url(link)
    anchor = find("#link a")

    expect(anchor[:href]).to eq expected_url
    expect(anchor.text).to eq expected_url
  end

  scenario "and defaults to HTTP if they don't give a scheme" do
    visit root_path

    fill_in "link_url", with: "gabebw.com"
    click_on "Shorten!"

    link = Link.last
    expect(link.url).to eq "http://gabebw.com"
  end
end
