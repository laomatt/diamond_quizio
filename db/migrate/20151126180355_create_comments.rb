class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :comment
      t.references :question
      t.references :user


      t.timestamps null: false
    end
  end

  def self.down
    drop_table :comments
  end
end
