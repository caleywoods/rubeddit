class Vote < ActiveRecord::Base
  belongs_to :link, :counter_cache => true
  belongs_to :user
  validate_on_create :is_voteable, :message => 'You have already voted on this link.'

  MAX_VOTE = 1

  def vote_count
    Vote.where(:user_id => self.user.id, :link_id => self.link.id).count
  end

  def is_voteable
    errors.add(:base, "You have already voted on this link.") unless self.vote_count < MAX_VOTE
  end
end
