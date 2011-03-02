class Vote < ActiveRecord::Base
  belongs_to :link, :polymorphic => true
  belongs_to :user

end
