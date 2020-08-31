class AddArgRankToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :arg_rank, :integer
  end
end
