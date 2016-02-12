class AddRankingToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :rankings, :string
  end
end
