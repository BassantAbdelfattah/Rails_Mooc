class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  mount_uploader :attachement, AttachmentUploader
  has_many :comments
  acts_as_votable
  has_and_belongs_to_many :users
  validates :content , :presence => true
  validates :course_id , :presence => true
  mount_uploader :image, ImageUploader

end
