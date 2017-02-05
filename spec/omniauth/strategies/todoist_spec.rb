require 'spec_helper'

describe OmniAuth::Strategies::Todoist do
  subject { OmniAuth::Strategies::Todoist.new({}) }

  before do
    OmniAuth.config.test_mode = true
  end

  describe "general" do
    it "should have correct name" do
      expect(subject.options.name).to eq("todoist")
    end
  end

  describe "endpoints" do
    it "should have correct site" do
      expect(subject.options.client_options.site).to eq("https://todoist.com/")
    end

    it "should have correct authorize url" do
      expect(subject.options.client_options.authorize_url).to eq("https://todoist.com/oauth/authorize")
    end

    it "should have correct token url" do
      expect(subject.options.client_options.token_url).to eq("https://todoist.com/oauth/access_token")
    end
  end

  describe "info" do
    before do
      allow(subject).to receive(:raw_info).and_return(raw_info_hash)
    end

    it "should return user" do
      expect(subject.info[:user]).to eq(raw_info_hash["user"])
    end

    it "should return email" do
      expect(subject.info[:email]).to eq(raw_info_hash["user"]["email"])
    end

    it "should return timezone" do
      expect(subject.info[:timezone]).to eq(raw_info_hash["user"]["tz_info"]["timezone"])
    end
  end
end

private

def raw_info_hash
  {
    "user" => {
      "email" => "foo@example.com",
      "tz_info" => {
        "timezone" => "Asia/Bangkok"
      }
    }
  }
end
