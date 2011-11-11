class Link < ActiveRecord::Base
  acts_as_voteable

  before_save(:on => :create) do
   self.short_url = Googl.shorten(self.url).short_url #from Googl gem
  end

  validates :url, :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5, :maximum => 100 }

  belongs_to :user # foreign key - user_id
  has_many :votes
  has_many :comments

  scope :latest, order('created_at DESC').limit(10)

  #def to_param
    #"#{id}-#{title.parameterize}"
  #end

end
