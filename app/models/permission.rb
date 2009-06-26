class Permission < ActiveRecord::Base
  belongs_to :permissionable, :polymorphic => true
end

class PermissionGroup < Permission
  belongs_to :group
end

class PermissionUser < Permission
  belongs_to :user
end