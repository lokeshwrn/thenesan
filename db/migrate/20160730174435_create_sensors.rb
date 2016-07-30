class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :sensor_1
      t.string :sensor_2
      t.string :sensor_3
      t.string :sensor_4
      t.string :total
      t.string :avg
      t.boolean :status

      t.timestamps null: false
    end
  end
end
