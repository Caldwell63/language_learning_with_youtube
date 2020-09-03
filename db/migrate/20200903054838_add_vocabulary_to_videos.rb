class AddVocabularyToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :vocabulary, :string, array: true
  end
end
