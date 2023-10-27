require 'rails_helper'

RSpec.describe "ProductsController", type: :request do
  describe "index" do
    it "" do
      user = FactoryBot.create(:user, name: "Test user")
      get products_path, params: { "user_id": 1 }
      pp response.body
      expect(response).to be_successful
      expect(response.body).to eq("Test user")
    end
  end
end
