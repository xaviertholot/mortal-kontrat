class CreateCharacterFights < ActiveRecord::Migration[5.1]
  def change
    create_table :character_fights do |t|
      t.references :character, foreign_key: true
      t.references :fight, foreign_key: true
      t.integer :delta_experience
      t.integer :result, default: 0
      t.timestamps
    end
  end
end
