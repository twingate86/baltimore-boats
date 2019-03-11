require 'rails_helper'

describe Product do
    context "when the product has comments" do
        let(:product) { Product.create!(name: "race boat", description: "very fast", colour: "red", price: "100", image_url: "row-boat.jpg") }
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
            expect(Product.new(description: "very fast", colour: "red", price: "100", image_url: "row-boat.jpg")).not_to be_valid
        end
        it "is not valid without description" do
            expect(Product.new(name: "race boat", colour: "red", price: "100", image_url: "row-boat.jpg")).not_to be_valid
        end
        it "is not valid without colour" do
            expect(Product.new(name: "race boat", description: "very fast", price: "100", image_url: "row-boat.jpg")).not_to be_valid
        end
        it "is not valid without price" do
            expect(Product.new(name: "race boat", description: "very fast", colour: "red", image_url: "row-boat.jpg")).not_to be_valid
        end
        it "is not valid without image_url" do
            expect(Product.new(name: "race boat", description: "very fast", colour: "red", price: "100")).not_to be_valid
        end
    end
end