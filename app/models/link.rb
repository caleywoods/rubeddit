class Link < ActiveRecord::Base
  validates :url, :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5, :maximum => 100 }

  belongs_to :user # foreign key - user_id
  has_many :votes
  has_many :comments

  scope :latest, order('created_at DESC').limit(10)

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end

end
