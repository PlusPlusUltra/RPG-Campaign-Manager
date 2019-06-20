class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :start_day
      t.integer :start_month
      t.integer :start_year
      t.integer :start_hour
      t.integer :start_minute
      t.integer :end_day
      t.integer :end_month
      t.integer :end_year
      t.integer :end_hour
      t.integer :end_minute

      t.timestamps
    end
  end
end
