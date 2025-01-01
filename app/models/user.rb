class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy, through: :reactions
  
         has_one_attached :avatar
         has_many_attached :images
       
         has_many :images, as: :imageable
         has_and_belongs_to_many :posts
       
         has_many :reactions
end
