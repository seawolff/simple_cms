class SectionEdit < ActiveRecord::Base
  
  #foreign keys
  belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
  belongs_to :section
  
end
