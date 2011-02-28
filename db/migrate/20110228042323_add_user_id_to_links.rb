class AddUserIdToLinks < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.integer :sub_user_id
    end
  end

  def self.down
    remove_column :links, :sub_user_id
  end
end
