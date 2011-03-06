class CleanUpSchmea < ActiveRecord::Migration
  def self.up
    drop_table :voteables
    remove_column :links, :down_votes
  end

  def self.down
    create_table :voteables do |t|
      t.timestamps
    end
    change_table :links do |t|
      t.integer :down_votes
      t.change_column_default :down_votes, 0
    end
  end
end
