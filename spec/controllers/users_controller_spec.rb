require 'rails_helper'

describe UsersController, type: :controller do
        let(:user) { User.create!(email: "idontwanna@gomail.com", password: "123456") }
        let(:user2) { User.create!(email: "test@gomail.com", password: "654321") }
    
        describe 'GET #show' do
            context 'when a user is logged in' do
                before do 
                    sign_in user 
                end
                it "loads correct user details" do
                   get :show, params: { id: user.id }
                   expect(assigns(:user)).to eq user 
                end
            end
            context 'when a user is not logged in' do
                it "redirects to login" do
                    get :show, params: { id: user.id }
                    expect(response).to redirect_to(new_user_session_path)
                end
            end
            context 'user cannot access user2 details' do
                it "redirects to login" do
                    get :show, params: { id: user2.id }
                    expect(response).to redirect_to(new_user_session_path)
                end
            end
            
        end         
end