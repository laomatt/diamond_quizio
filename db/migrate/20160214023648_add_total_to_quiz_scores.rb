class AddTotalToQuizScores < ActiveRecord::Migration
  def change
    add_column :quiz_scores, :total, :integer
  end
end
