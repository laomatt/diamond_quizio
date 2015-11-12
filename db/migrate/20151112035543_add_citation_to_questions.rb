class AddCitationToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :citation, :string
  end
end
