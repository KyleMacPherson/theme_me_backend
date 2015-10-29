class Song < ActiveRecord::Base
  validates_uniqueness_of :url
  validates_presence_of :person
end
