class AddBlockToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :block, :boolean, :default => false
  end
end
