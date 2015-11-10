class AddRealAnswerToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :real_answer, :string
  end
end
