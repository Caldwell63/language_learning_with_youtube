class Video < ApplicationRecord
  include PgSearch::Model
  # validates :youtube_id, uniqueness: true

  scope :level_1, -> { where(level: 1..500) }
  scope :level_2, -> { where(level: 500..1000) }
  scope :level_3, -> { where(level: 1000..1500) }
  scope :level_4, -> { where(level: 1500..2000) }
  scope :level_5, -> { where(level: 2000..3000) }
  scope :level_6, -> { where(level: 3000..5000) }

  pg_search_scope :search,
    against: [:title, :level],
    using: {
      tsearch: { prefix: true }
    }
end
