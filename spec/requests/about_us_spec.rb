require 'rails_helper'

RSpec.describe "AboutUs", type: :request do
  describe "GET /about_us" do
    it "returns http success" do
      get "/about_us/show
      expect(response).to have_http_status(:success)
    end
  end

end
