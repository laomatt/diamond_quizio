class AddDummyAnswer2ToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :dummy_answer2, :string
  end
end
