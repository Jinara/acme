class Hit < ApplicationRecord
	belongs_to :user

  validates :month, uniqueness: { scope: :year, message: "should happen once per year" }
  validates :year, numericality: { only_integer: true, less_than_or_equal_to: Time.zone.now.year }

end
