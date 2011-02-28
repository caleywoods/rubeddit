class AddUserIdToLinks < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.integer :user_id
    end
  end

  def self.down
    remove_column :links, :user_id
  end
end
