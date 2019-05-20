class ChangeClassName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :characters, :class, :class_type
  end
end
