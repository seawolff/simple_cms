class Page < ActiveRecord::Base
  
  #belongs_to always = foreign key
  belongs_to :subject #, {:foreign_key => "subject_id"}
  
  #pages have many sections
  has_many :sections
  
  #pages have many "editors"(admin users) and viseversa We can name admin_users whatever we like as long as we point to the class "AdminUser"
  has_and_belongs_to_many :editors, :class_name => "AdminUser"
  
  #makes sure that page always has a name
  validates_presence_of :name
  
  #makes sure the page name is not over the database limit
  validates_length_of :name, :maximum => 255
  
  #permalink validation:
  
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence with length to disallow spaces
  validates_uniqueness_of :permalink
    # for unique values by subject, :scope => :subject_id
  
end
