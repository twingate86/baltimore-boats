class Product < ApplicationRecord
    has_many :orders
    def self.search(search_term)
    Product.where("name LIKE ?", "%#{search_term}%")
    end
    def self.search1(search_term)
    Product.where("name ilike ?", "%#{search_term}%")
    end
end