class CreateQuestionStats < ActiveRecord::Migration
  def change
    create_table :question_stats do |t|
      t.boolean :correct
      t.references :question
      t.references :user

      t.timestamps null: false
    end
  end
end
