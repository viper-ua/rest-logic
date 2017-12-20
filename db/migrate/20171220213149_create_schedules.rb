class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.integer :weekday
      t.time :time_open
      t.time :time_close
      t.belongs_to :restaurant, index: true

      t.timestamps
    end
  end
end
