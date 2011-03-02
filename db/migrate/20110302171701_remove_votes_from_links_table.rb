class RemoveVotesFromLinksTable < ActiveRecord::Migration
  def self.up
    remove_column :links, :up_votes
    remove_column :links, :down_vote
  end

  def self.down
    change_table :links do |t|
      t.integer :up_votes
      t.integer :down_votes 
    end
    change_column_default(:links, :up_votes, 0)
    change_column_default(:links, :down_votes, 0)
  end
end
