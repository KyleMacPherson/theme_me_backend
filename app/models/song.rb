class Song < ActiveRecord::Base
  validates_presence_of :person
end
