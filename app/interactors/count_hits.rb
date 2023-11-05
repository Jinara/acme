class CountHits
  include Interactor

  MAX_HITS = 10

  def call
    count = current_count
    if count < MAX_HITS
      context.count = count
    else
      context.fail!(message: 'over quota')
    end
  end

  private

  def current_count
    current_month = Time.zone.now.month
    current_year = Time.zone.now.year

    hit = context.user.hits.where(month: current_month, year: current_year).last
    hit.current_count
  end
end
