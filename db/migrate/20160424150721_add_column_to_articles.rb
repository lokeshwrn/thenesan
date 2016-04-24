class AddColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :banner_text, :string
    add_column :articles, :banner_url, :string
  end
end
