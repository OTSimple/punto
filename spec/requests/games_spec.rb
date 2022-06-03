require 'rails_helper'

RSpec.describe "Games", type: :request do
  describe "POST /create" do
    it "returns http success" do
      post "/games"
      expect(response).to have_http_status(:success)
    end
  end

end
