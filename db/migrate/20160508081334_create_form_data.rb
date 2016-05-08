class CreateFormData < ActiveRecord::Migration
  def change
    create_table :form_data do |t|
      t.text :field
      t.string :value_of
      t.string :seperator

      t.timestamps null: false
    end
  end
end