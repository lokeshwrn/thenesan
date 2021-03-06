class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :content
      t.boolean :status
      t.string :alias_url
      t.string :img_url
      t.integer :sequence_number
      t.string :article_type
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
