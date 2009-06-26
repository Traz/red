class CreateWikis < ActiveRecord::Migration
  def self.up
    create_table :wikis do |t|
      t.string :title
      t.text :page
      t.integer :owner_id
      t.integer :writer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :wikis
  end
end
