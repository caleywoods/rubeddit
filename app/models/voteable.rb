class Voteable < ActiveRecord::Base
  
  belongs_to :user
  
  acts_as_voteable
  
end
