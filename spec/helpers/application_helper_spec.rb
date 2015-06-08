require "rails_helper"

describe ApplicationHelper, type: :helper do
  describe "#resource_name" do
    it "returns user" do
      expect(helper.resource_name).to eq(:user)
    end
  end
  describe "#resource" do
    context "when @resource is setted" do
      it "returns user" do
        @resource = User.new
        expect(helper.resource).to eq(@resource)
      end
    end
    context "otherwise" do
      it "returns a new User" do
        expect(User).to receive(:new)
        helper.resource
      end
    end
  end
  describe "#devise_mapping" do
    context "when @devise_mapping is setted" do
      it "returns devise_mapping" do
        @devise_mapping = Devise.mappings[:user]
        expect(helper.devise_mapping).to eq(@devise_mapping)
      end
    end
  end
  describe "#show_shortened_url" do
    it "returns shortened_url's link with it's unique key" do
      shortened_url = Shortener::ShortenedUrl.generate("google.com")
      expect(helper).to receive(:url_for)
      helper.show_shortened_url(shortened_url)
    end
  end
end