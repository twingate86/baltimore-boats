class Product < ApplicationRecord
    has_many :orders
    has_many :comments
    validates :name, presence: true
    validates :description, presence: true
    validates :colour, presence: true
    validates :price, presence: true
    validates :image_url, presence: true
    def self.search(search_term)
        Product.where("description || name LIKE ?", "%#{search_term}%")
    end
    def self.search1(search_term)
        Product.where("description || name ilike ?", "%#{search_term}%")
    end
    
    def highest_rating_comment
        comments.rating_desc.first
    end
    def lowest_rating_comment
        comments.ratings_asc.first
    end
    def average_rating
        comments.average(:rating).to_f
    end
end