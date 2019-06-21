class CreatePlanners < ActiveRecord::Migration[5.2]
  def change
    create_table :planners do |t|
      t.string :sender
      t.string :dest
      t.integer :senderid
      t.integer :destid
      t.string :answer
      t.integer :day
      t.integer :month
      t.integer :year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
