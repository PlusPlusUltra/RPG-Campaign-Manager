class AddCharacters < ActiveRecord::Migration[5.2]
  def change
  	create_table :characters do |t|
  		t.string :name
  		t.integer :lvl
  		t.string :class
  		t.string :race
  		t.string :info
  	end
  end
end
