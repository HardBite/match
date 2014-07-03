class Match < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos

  attr_accessor :rate

  
end
