class Video < ApplicationRecord
  include PgSearch::Model
  # validates :youtube_id, uniqueness: true

  scope :level_1, -> { where(level: 1..199) }
  scope :level_2, -> { where(level: 200..319) }
  scope :level_3, -> { where(level: 320..1500) }
  scope :level_4, -> { where(level: 1..1500) }

  pg_search_scope :search,
    against: [:title, :level],
    using: {
      tsearch: { prefix: true }
    }
end
