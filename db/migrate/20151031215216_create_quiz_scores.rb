class CreateQuizScores < ActiveRecord::Migration
  def change
    create_table :quiz_scores do |t|
      t.references :user
      t.references :quiz
      t.integer :score
      t.timestamps null: false
    end
  end
end
