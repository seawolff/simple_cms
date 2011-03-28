class Section < ActiveRecord::Base
  
  #foreign key of page
  belongs_to :page
  
  has_many :section_edits
  
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
  
  #makes sure that section always has a name
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
  #constent
  CONTENT_TYPES = ['text', 'HTML']
  #makes sure text is either text or HTML
  validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  
  validates_presence_of :content
  
end
