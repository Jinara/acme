module CountHits
  include Interactor

  def call(user: user)
    count = current_count(user)
    if count <= 10
      context.count = count
    else
      context.fail!(message: "over quota")
    end
  end

  def current_count(user)
    current_month = Time.zone.now.month
    hit = user.where(month: current_month)
    hit.count
  end
end
