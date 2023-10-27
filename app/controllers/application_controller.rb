class ApplicationController < ActionController::Base
  before_action :user_quota

  def user_quota
    id = params.require("user_id")
    user = User.find(id)
    response = CountHits.call(user: user)

    if not response.success?
      render json: { error: response.message }
    end
  end
end
