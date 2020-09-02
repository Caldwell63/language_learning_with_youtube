class AddGifToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :gif, :string
  end
end
