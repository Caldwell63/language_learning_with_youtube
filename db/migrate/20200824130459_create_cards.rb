class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.integer :stage
      t.date :known_on
      t.references :user, null: false, foreign_key: true
      t.references :word, null: false, foreign_key: true
      t.timestamps
    end
  end
end
