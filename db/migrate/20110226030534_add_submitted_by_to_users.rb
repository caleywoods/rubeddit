class AddSubmittedByToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :submitted_by, :default => 'Anonymous'
    end
  end

  def self.down
    remove_column :users, :submitted_by
  end
end
