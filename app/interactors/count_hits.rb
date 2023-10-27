class CountHits
  include Interactor

  def call
    count = current_count
    if count < 10
      context.count = count
    else
      context.fail!(message: "over quota")
    end
  end

  def current_count
    current_month = Time.zone.now.month
    current_year = Time.zone.now.year
    hit = context.user.hits.where(month: current_month, year: current_year).last
    hit.current_count
  end
end
