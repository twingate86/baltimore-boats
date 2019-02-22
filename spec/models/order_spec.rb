require 'rails_helper'

describe Order do

    it "is not valid without user" do
        expect(Order.new(product_id: 2)).not_to be_valid
    end
    
    it "is not valid without product" do
        expect(Order.new(user_id: 3)).not_to be_valid
    end
 
end