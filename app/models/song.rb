class Song < ActiveRecord::Base
  
  validates_presence_of :person
  belongs_to :user

end