class AddDefaultValueToVotes < ActiveRecord::Migration
  def self.up
    change_column_default(:links, :up_votes, 0)
    change_column_default(:links, :down_vote, 0)
  end

  def self.down
    change_column_default(:links, :up_votes, nil)
    change_column_default(:links, :down_vote, nil)
  end
end
