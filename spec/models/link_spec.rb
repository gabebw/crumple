require "rails_helper"

describe Link do
  context "validations" do
    it { should validate_presence_of(:url) }

    it "validates that its URL starts with a scheme" do
      link = Link.new(url: "gabebw.com")

      link.valid?

      expect(link.errors.full_messages).to eq [
        'URL must start with a scheme, like "http://"'
      ]
    end
  end

  context "#missing_scheme?" do
    it "returns true if the URL has no scheme" do
      link = Link.new(url: "gabebw.com")

      expect(link).to be_missing_scheme
    end

    it "returns false if the URL does have a scheme" do
      link = Link.new(url: "ftp://gabebw.com")

      expect(link).not_to be_missing_scheme
    end
  end
end
