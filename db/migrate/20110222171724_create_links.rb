class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :url
      t.string :title
      t.integer :up_votes
      t.integer :down_vote

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
