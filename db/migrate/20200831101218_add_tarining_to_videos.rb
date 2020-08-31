class AddTariningToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :training, :string
  end
end
