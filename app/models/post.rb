class Post < ApplicationRecord
    belongs_to :user
  
    has_many :images, as: :imageable
    has_many_attached :images
    has_many :reactions
  
    has_many :users, through: :reactions
    
  
     #  crea una nueva categoria si biene blanco
    #  accepts_nested_attributes_for :categories, reject_if: :no_name_category
  
    #  def no_name_category(attributes)
    #    attributes['name'].blank?
    #  end
  
     def count_with_kind(arg)
       number = self.reactions.where(kind: arg).count
       return "#{arg} - #{number}"
     end
  
     def find_kind_user_relation(user)
       self.reactions.find_by(user_id: user.id).kind
     end
  end