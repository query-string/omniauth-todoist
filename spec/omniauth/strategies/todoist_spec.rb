require 'spec_helper'

describe OmniAuth::Strategies::Todoist do
  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  subject do
    OmniAuth::Strategies::Todoist.new({})
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
end
