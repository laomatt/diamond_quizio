class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.string :reply
      t.references :comment
      t.references :user

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :replies
  end
end
