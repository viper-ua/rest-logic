class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :time_from
      t.datetime :time_to
      t.belongs_to :table, index: true

      t.timestamps
    end
  end
end
