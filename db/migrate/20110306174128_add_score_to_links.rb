class AddScoreToLinks < ActiveRecord::Migration
  def self.up
    change_table :votes do |t|
      t.integer :score
    end
  end

  def self.down
    remove_column :votes, :score
  end
end
