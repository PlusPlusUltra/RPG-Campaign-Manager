class AddSenderidToInvites < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :senderid, :integer
  end
end
