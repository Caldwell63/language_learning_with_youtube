class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :youtube_id
      t.string :title
      t.integer :level
      t.string :subtitle, array: true

      t.timestamps
    end
  end
end
