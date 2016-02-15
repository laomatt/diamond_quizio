class AddThumbnailToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :thumbnail_url, :string
  end
end
