class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  mount_uploader :attachement, AttachmentUploader
  has_many :comments
  acts_as_votable
  has_and_belongs_to_many :users
  validates :content , :attachement, :image, :course_id, :title, :presence => true
  validates :title, length: { minimum: 3 , maximum: 20}
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

end
