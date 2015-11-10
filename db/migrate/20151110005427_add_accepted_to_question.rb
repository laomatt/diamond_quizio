class AddAcceptedToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :accepted, :boolean, default: false
  end
end
