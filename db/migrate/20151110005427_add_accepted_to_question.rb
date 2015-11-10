class AddAcceptedToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :accepted, :boolean,
    add_column :questions, :default, :false
  end
end
