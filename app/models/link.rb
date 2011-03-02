class Link < ActiveRecord::Base
  validates :url, :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5, :maximum => 100 }

  belongs_to :user # foreign key - user_id
  has_many :votes, :as => :voteable

  acts_as_voteable # required for vote_fu

end
