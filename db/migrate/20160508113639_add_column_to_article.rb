class AddColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :page_title, :string
    add_column :articles, :meta_data, :string
  end
end
