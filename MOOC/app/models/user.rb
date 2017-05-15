class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader
  has_many :courses, dependent: :destroy
  has_many :lectures, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name , :presence => true , length: { minimum: 5 , maximum: 17}
  validates :gender , :image, :date_of_birth, :presence => true
  has_and_belongs_to_many :lectures

end
