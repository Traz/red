class User < ActiveRecord::Base
  #using_access_control
  serialize :roles, Array
  #acts_as_authorization_subject
  
  acts_as_authentic do |c|
    c.login_field = :ident
  end  
  has_many :wiki_owner, :class_name => "Wiki", :foreign_key => "owner_id"
  has_many :wiki_writer, :class_name => "Wiki", :foreign_key => "writer_id"
  
  has_many :group_members
  has_many :groups # group creator
  def full_name
    n = self.lastname.nil? ? "" : self.lastname.split('-').map{|x| x.first.capitalize}.join('.')
    n + ". " + self.username.capitalize
  end
  
  def entire_name
    "#{self.lastname}".capitalize + " " + "#{self.username.capitalize}"
  end
end
