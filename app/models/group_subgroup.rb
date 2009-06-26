class GroupSubgroup < ActiveRecord::Base
  belongs_to :group
  belongs_to :subgroup, :class_name => 'Group', :foreign_key => 'subgroup_id'
  
  validates_uniqueness_of :group_id, :scope => :subgroup_id
end
