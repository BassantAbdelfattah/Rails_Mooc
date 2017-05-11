class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lectures
  has_and_belongs_to_many :lectures
  validates :title , :presence => true 

end
