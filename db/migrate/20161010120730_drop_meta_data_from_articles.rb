class DropMetaDataFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :meta_data, :string
    add_column :articles, :meta_title, :string
    add_column :articles, :meta_keywords, :string
    add_column :articles, :meta_description, :string
  end
end
