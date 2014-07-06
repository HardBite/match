class Match < ActiveRecord::Base
  has_many :photos
  has_many :users, through: :user_vote
  attr_accessor :rate

  
end
