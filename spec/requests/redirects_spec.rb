require "rails_helper"

describe "Redirecting to the original URL" do
  it "redirects to the original URL" do
    link = create(:link, url: "http://gabebw.com")

    get redirect_path(link)

    expect(response).to redirect_to link.url
  end
end
