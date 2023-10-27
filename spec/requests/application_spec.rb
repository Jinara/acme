require 'rails_helper'

RSpec.describe "Application", type: :request do
  describe "request user quota" do
    user = FactoryBot.create(:user, name: "Test user")
    get user_quota_path
    expect(response).to be_successful
    expect(response.body).to include("Test user")
  end
end
