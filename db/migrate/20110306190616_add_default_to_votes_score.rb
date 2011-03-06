class AddDefaultToVotesScore < ActiveRecord::Migration
  def self.up
    change_column_default :votes, :score, 0
  end

  def self.down
    change_column_default :votes, :score, nil
  end
end
