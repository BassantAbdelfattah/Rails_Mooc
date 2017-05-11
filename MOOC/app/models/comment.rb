class Comment < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :user
  validates :content , :presence => true

end
