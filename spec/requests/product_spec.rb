require 'rails_helper'

RSpec.describe "ProductsController", type: :request do
  describe "index" do
    it "The user still have available hits" do
      user = FactoryBot.create(:user, name: "Test user")
      FactoryBot.create(:hit, month: 9, year: 2023, current_count: 10, user: user, endpoint: 'products')
      hit = FactoryBot.create(:hit, month: Time.zone.now.month, year: 2023, current_count: 3, user: user, endpoint: 'products')
      get products_path, params: { "user_id": 1 }
      expect(response).to be_successful
      expect(response.body).to eq("{\"message\":\"ok\"}")
    end

    it "The user does not have available hits" do
      user = FactoryBot.create(:user, name: "Test user")
      FactoryBot.create(:hit, month: 9, year: 2023, current_count: 10, user: user, endpoint: 'products')
      hit = FactoryBot.create(:hit, month: Time.zone.now.month, year: 2023, current_count: 10, user: user, endpoint: 'products')
      get products_path, params: { "user_id": 1 }
      expect(response).to be_successful
      expect(response.body).to eq("{\"error\":\"over quota\"}")
    end
  end
end
