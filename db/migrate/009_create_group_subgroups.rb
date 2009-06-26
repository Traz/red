class CreateGroupSubgroups < ActiveRecord::Migration
  def self.up
    create_table :group_subgroups do |t|
      t.references :group
      t.references :subgroup

      t.timestamps
    end
  end

  def self.down
    drop_table :group_subgroups
  end
end
