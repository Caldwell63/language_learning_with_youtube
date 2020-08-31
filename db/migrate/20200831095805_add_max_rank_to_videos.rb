class AddMaxRankToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :max_rank, :integer
  end
end
