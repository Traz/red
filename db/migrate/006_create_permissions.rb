class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.references  :group
      t.references  :user
      t.references  :permissionnable, :polymorphic => true
      t.string      :type
      
      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
