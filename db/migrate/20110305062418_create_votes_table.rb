class CreateVotesTable < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.references :link #link_id
      t.references :user #user_id

      t.timestamps #rails magic for created_at and updated_at
    end
  end

  def self.down
    drop_table :votes
  end
end
