require 'rails_helper'

describe Product do
    context "when the product has comments" do
        let(:product) { Product.create!(name: "race boat") }
        let(:user) { User.create!(email: "idontwanna@gomail.com", password: "123456") }
        
        before do
            product.comments.create!(rating: 1, user: user, body: "Awful boat!")
            product.comments.create!(rating: 3, user: user, body: "Ok boat!")
            product.comments.create!(rating: 5, user: user, body: "Great boat!")
        end
        it "returns the average rating of all comments" do
            expect(product.average_rating).to eq 3
        end
    
        it "is not valid without name" do
            expect(Product.new(description: "Nice boat")).not_to be_valid
        end
    end
end