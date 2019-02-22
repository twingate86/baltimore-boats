require 'rails_helper'

describe User do

    it "is not valid without email" do
        expect(User.new(encrypted_password: 123456)).not_to be_valid
    end
    
    it "is not valid without password" do
        expect(User.new(email: "idontwanna@gomail.com")).not_to be_valid
    end
 
end