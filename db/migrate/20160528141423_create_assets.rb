class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.string :alias_name
      t.boolean :status, :default => true
      t.string :access
      t.integer :access_code
      t.string :location
      t.integer :sequence_number

      t.timestamps null: false
    end
  end
end
