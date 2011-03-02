class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :link #references same as doing t.integer :link_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
