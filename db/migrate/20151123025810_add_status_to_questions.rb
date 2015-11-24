class AddStatusToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :status, :string
  end

  def self.down
    remove_column :questions, :status
  end
end
