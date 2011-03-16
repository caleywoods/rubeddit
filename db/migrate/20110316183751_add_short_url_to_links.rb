class AddShortUrlToLinks < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.string :short_url
    end
  end

  def self.down
    remove_column :links, :short_url
  end
end
