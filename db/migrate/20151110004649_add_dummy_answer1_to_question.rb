class AddDummyAnswer1ToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :dummy_answer1, :string
  end
end
