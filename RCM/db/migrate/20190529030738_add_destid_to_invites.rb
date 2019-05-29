class AddDestidToInvites < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :destid, :integers
  end
end
