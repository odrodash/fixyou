require 'rails_helper'

RSpec.describe "Preferences", type: :request do
  describe "GET /scheme_color" do
    it "returns http success" do
      get "/preferences/scheme_color"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /switch_locale" do
    it "returns http success" do
      get "/preferences/switch_locale"
      expect(response).to have_http_status(:success)
    end
  end

end
