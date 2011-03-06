class RemoveSubmittedByOnUserTable < ActiveRecord::Migration
  def self.up
    remove_column :users, :submitted_by
    remove_column :users, :submittedby
  end

  def self.down
    change_table :users do |t|
    t.string :submittedby
    end
  end

end
