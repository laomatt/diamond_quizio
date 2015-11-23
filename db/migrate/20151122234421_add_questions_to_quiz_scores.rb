class AddQuestionsToQuizScores < ActiveRecord::Migration
  def self.up
    add_column :quiz_scores, :questions, :string
  end

  def self.down
    remove_column :quiz_scores, :questions
  end
end
