class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :img_url
      t.boolean :status
      t.string :alias_url
      t.text :content

      t.timestamps null: false
    end
  end
end