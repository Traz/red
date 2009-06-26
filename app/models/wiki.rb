class Wiki < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  belongs_to :writer, :class_name => "User", :foreign_key => "writer_id"  
  
  acts_as_versioned :if_changed => [:title, :page]  
  acts_as_textiled :page

  
  def writers
    self.versions.map(&:writer_id).uniq
  end
end
