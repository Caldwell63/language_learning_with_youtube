class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :en
      t.string :fr
      t.string :de
      t.integer :rank
      t.integer :frequency

      t.timestamps
    end
  end
end
