class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lectures
  validates :title , :presence => true

end
