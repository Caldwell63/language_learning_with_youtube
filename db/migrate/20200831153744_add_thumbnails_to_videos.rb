class AddThumbnailsToVideos < ActiveRecord::Migration[6.0]
  def change
        add_column :videos, :thumbnails, :string
  end
end


