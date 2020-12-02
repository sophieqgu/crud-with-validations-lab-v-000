class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: %i[:release_year :artist_name] }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, unless: -> { released.is_false? }, numericality: { less_than_or_equal_to: Date.today.year }
  validates :artist_name, presence: true
end
