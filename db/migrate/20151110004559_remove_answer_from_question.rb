class RemoveAnswerFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :answer, :string
  end
end
