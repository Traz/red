class Group < ActiveRecord::Base
  belongs_to :user
  has_many  :group_members, :dependent => :destroy
  has_many  :group_subgroups, :dependent => :destroy
  has_many  :subgroup, :class_name => 'GroupSubgroup', :foreign_key => 'subgroup_id'
  validates_uniqueness_of :name
  
  def auto
  end
end
