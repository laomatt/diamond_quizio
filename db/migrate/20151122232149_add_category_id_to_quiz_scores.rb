class AddCategoryIdToQuizScores < ActiveRecord::Migration
  def self.up
    add_column :quiz_scores, :category_id, :integer
  end

  def self.down
    remove_column :quiz_scores, :category_id
  end
end
