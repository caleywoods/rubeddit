class CreateVoteables < ActiveRecord::Migration
  def self.up
    create_table :voteables do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :voteables
  end
end
