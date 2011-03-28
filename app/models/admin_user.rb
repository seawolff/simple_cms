require 'digest/sha1'

class AdminUser < ActiveRecord::Base
  #To configure a different table name
  # set_table_name("admin_users")
  
  has_and_belongs_to_many :pages
  
  has_many :section_edits
  
  #admin_users have many sections but through the join table section_edits
  has_many :sections, :through => :section_edits
  
  #VALIDATION:
    
    #email constant
    EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
    
    #BEGIN STANDARD VALIDATION METHODS:  
      #first name
      #validates_presence_of :first_name
      #validates_length_of :first_name, :maximum => 25
    
      #last name
      #validates_presence_of :last_name
      #validates_length_of :last_name, :maximum => 50
    
      #username
      #validates_presence_of :username
      #validates_length_of :username, :within => 8..25
    
      #email
      #validates_presence_of :email
      #validates_length_of :email, :maximum => 100
      #validates_format_of :email, :with => EMAIL_REGEX
      #validates_confirmation_of :email
    
    #BEGIN NEW "SEXY" VALIDATIONS:
      validates :first_name, :presence => true, :length => { :maximum => 25 }
      validates :last_name, :presence => true, :length => { :maximum => 50 }
      validates :username, :length => { :within => 8..25 }, :uniqueness => true
      validates :email, :presence => true, :length => { :maximum => 100 }, :format => EMAIL_REGEX, :confirmation => true
  
  
  scope :named, lambda {|first, last| where(:first_name => first, :last_name => last)}


  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end

  def self.hash(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
    
end
