class Review < ApplicationRecord
  belongs_to :cocktail

  validates :name, :content, :rating, presence: true
  validates :rating, numericality: { 
    only_integer: true, 
    inclusion: { 
      in: 0..5, 
      message: "The rating must be between 0 and 5." 
    } 
  }
  validates :content, length: { 
    maximum: 250, 
    too_long: "%{count} characters is the maximum allowed"
  }
end
