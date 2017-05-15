class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lectures
  validates :title , :presence => true
  validates :title, length: { minimum: 3 , maximum: 20}


end
