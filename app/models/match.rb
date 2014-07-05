class Match < ActiveRecord::Base
  has_many :photos

  attr_accessor :rate

  
end
