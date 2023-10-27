class CountHits
  include Interactor

  def call
    count = current_count
    if count <= 10
      context.count = count
    else
      context.fail!(message: "over quota")
    end
  end

  def current_count
    current_month = Time.zone.now.month
    hit = context.user.hits.where(month: current_month)
    hit.count
  end
end
