class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :force
      t.string :picture
      t.timestamps
    end

    add_reference :character_fights, :weapon, index: true
  end
end
