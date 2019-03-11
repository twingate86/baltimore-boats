require 'rails_helper'

describe Comment do

    it "is not valid without body" do
        expect(Comment.new(rating: 2)).not_to be_valid
    end

    it "is not valid without rating" do
        expect(Comment.new(body: "Great boat")).not_to be_valid
    end
end