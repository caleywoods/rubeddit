class User < ActiveRecord::Base
  acts_as_voter

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :links
  has_many :votes, :through => :links

  def karma
    self.votes.sum(:score)
  end

  def positive_votes
    self.votes.sum(:score, :conditions => 'score > 0')
  end

  def negative_votes
    self.votes.sum(:score, :conditions => 'score < 0')
  end

end
