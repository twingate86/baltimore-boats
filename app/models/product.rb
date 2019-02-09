class Product < ApplicationRecord
    has_many :orders
    has_many :comments
    def self.search(search_term)
        Product.where("name LIKE ?", "%#{search_term}%")
    end
    def self.search1(search_term)
        Product.where("name ilike ?", "%#{search_term}%")
    end
    def highest_rating_comment
        comments.rating_desc.first
    end
end