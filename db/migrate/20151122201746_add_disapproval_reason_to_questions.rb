class AddDisapprovalReasonToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :disapproval_reason, :text
  end

  def self.down
    remove_column :questions, :disapproval_reason
  end
end
