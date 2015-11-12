class AddDummyAnswer3ToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :dummy_answer3, :string
  end
end
