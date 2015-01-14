require "rails_helper"

describe Link do
  context "validations" do
    it { should validate_presence_of(:url) }
  end
end
