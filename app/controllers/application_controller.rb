class ApplicationController < ActionController::Base
  before_action :user_quota

  def user_quota
    response = CountHits.call(user: user)

    if not response.success?
      render json: { error: response.message }
    end
  end

  private

  def user
    id = params.require("user_id")
    User.find(id)
  end
end
