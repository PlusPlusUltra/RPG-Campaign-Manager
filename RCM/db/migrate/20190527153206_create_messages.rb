class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :dest
      t.string :type
      t.string :sender
      t.string :campaign
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
