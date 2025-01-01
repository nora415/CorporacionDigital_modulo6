class Reaction < ApplicationRecord
    belongs_to :post
    belongs_to :user
  
    validates :kind, acceptance: {
      accept: %w[like dislike ],
    }  
  
    def self.kinds
        %w[like dislike ]
    end
  
  end
