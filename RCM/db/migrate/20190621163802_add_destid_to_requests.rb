class AddDestidToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :destid, :integer
  end
end
