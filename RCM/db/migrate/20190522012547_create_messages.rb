class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :type
      t.string :dest
      t.string :campaign
      t.string :date

      t.timestamps
    end
  end
end
