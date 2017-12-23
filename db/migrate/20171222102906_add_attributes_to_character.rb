class AddAttributesToCharacter < ActiveRecord::Migration[5.1]
  def change
      add_column :characters, :name, :string, :null => false
      add_column :characters, :lifepoints, :integer, :null => false
      add_column :characters, :attack, :integer, :null => false
      add_column :characters, :experience, :integer, :null => false
      add_column :characters, :picture, :string, :null => false
  end
end
