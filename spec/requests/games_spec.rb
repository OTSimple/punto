require 'rails_helper'

RSpec.describe "Games", type: :request do
  describe "POST /create" do
    it "returns http success" do
      post "/games", params: { game: { user_pseudo: "Test" }}
      expect(response).to have_http_status(:success)
    end
  end

end
