class AddTagsToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :tags, :string, array: true
  end
end
