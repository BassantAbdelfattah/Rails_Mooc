class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader
  has_many :courses
  has_many :lectures
  has_many :comments
  validates :name , :presence => true , length: { minimum: 5 , maximum: 17}
  validates :gender , :presence => true

  validates :date_of_birth, :presence => true

end
