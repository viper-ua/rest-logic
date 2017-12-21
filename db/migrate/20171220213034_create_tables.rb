class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.string :name
      t.belongs_to :restaurant, index: true

      t.timestamps
    end
  end
end
