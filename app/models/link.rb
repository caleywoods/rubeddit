class Link < ActiveRecord::Base
  validates :url, :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5, :maximum => 100 }

  has_many :comments, :dependent => :destroy
  belongs_to :user

 def self.latest
  order('created_at ASC')
 end

end
