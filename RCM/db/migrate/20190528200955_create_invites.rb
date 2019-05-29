class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.string :dest
      t.string :campaign
      t.string :sender
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
