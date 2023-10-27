class ApplicationController < ActionController::Base
  before_action :user_quota

  def user_quota
    id = params.require("user_id")
    user = User.find(id)
    CountHits.call(user: user)
  end
end
