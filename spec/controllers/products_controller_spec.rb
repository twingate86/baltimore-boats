require 'rails_helper'

describe ProductsController, type: :controller do
    let!(:product1) { FactoryBot.create(:product) }
    let(:user) { FactoryBot.create(:user) }
    let(:user2) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:admin) }

    describe 'GET #index' do
        it 'renders the index template' do
            get :index
            expect(response).to be_ok
            expect(response).to render_template('index')
        end
    end

    describe 'GET #show' do
        it 'renders correct product' do
            get :show, params: { id: product1.id }
            expect(assigns(:product)).to eq product1
        end

        it 'renders the products/show template' do
            get :show, params: { id: product1.id }
            expect(response).to be_ok
            expect(response).to render_template('show')
        end
    end

    describe 'GET #new' do
        context 'when an admin is signed in' do
            before do 
                sign_in admin
            end

            it 'renders the new product page' do
                get :new
                expect(response).to be_ok
                expect(response).to render_template('new')
            end
        end 
        context 'when no one is signed in' do
            it 'redirects to root' do
                get :new
                expect(response).to redirect_to(root_path)
            end
        end 
        context 'when non-admin is signed in' do
            before do
                sign_in user
            end
            it 'redirects to root' do
                get :new
                expect(response).to redirect_to(root_path)
            end
        end 
    end

    describe 'GET #edit' do
        context 'when an admin is signed in' do
            before do 
                sign_in admin
            end

            it 'renders the correct edit product page' do
                get :edit, params: { id: product1.id }
                expect(response).to be_ok
                expect(response).to render_template('edit')
            end
        end 
        context 'when no one is signed in' do
            it 'redirects to root' do
                get :edit, params: { id: product1.id }
                expect(response).to redirect_to(root_path)
            end
        end 
        context 'when a non-admin is signed in' do
            before do 
                sign_in user
            end

            it 'redirects to root' do
                get :edit, params: { id: product1.id }
                expect(response).to redirect_to(root_path)
            end
        end 
    end

    describe 'POST products#create' do
        context 'when an admin is logged in' do
            before do
                sign_in admin
            end

            context 'with valid attributes' do
                it 'should save the new product in the database' do
                    expect {
                        post :create, params: { product: { name:  "test", description: "test", colour: "red", price: "100", image_url: "row-boat.jpg" } }
                        }.to change(Product, :count).by(1)
                end
            end

            context 'with invalid attributes' do
                it 'should not save the new product in the database' do
                    expect {
                        post :create, params: { product: { description:  "test", colour: "red" } }
                        }.to_not change(Product, :count)
                end
            end
        end

        context 'when no one is logged in' do
            it 'should redirect to root' do
                expect {
                    post :create, params: { product: { name:  "test", description: "test", colour: "red", price: "100", image_url: "row-boat.jpg" } }
                    }.to_not change(Product, :count)
                expect(response).to redirect_to(root_path)
            end
        end
        context 'when non-admin user is logged in' do
            before do
                sign_in user
            end
            it 'should redirect to root' do
                expect {
                    post :create, params: { product: { name:  "test", description: "test", colour: "red", price: "100", image_url: "row-boat.jpg" } }
                    }.to_not change(Product, :count)
                expect(response).to redirect_to(root_path)
            end
        end
    end
    describe 'POST products#destroy' do
        context 'when an admin is logged in' do
            before do
                sign_in admin
            end
            it 'deletes product from database' do
                expect { delete :destroy, params: { id: product1.id }
                    }.to change(Product, :count).by (-1)
            end
        end
        context 'when no one is logged in' do
            it 'should redirect to root' do
                expect { delete :destroy, params: { id: product1.id }
                    }.to_not change(Product, :count)
                expect(response).to redirect_to(root_path)
            end
        end
        context 'when non-admin user is logged in' do
            before do
                sign_in user
            end
            it 'should redirect to root' do
                expect { delete :destroy, params: { id: product1.id }
                    }.to_not change(Product, :count)
                expect(response).to redirect_to(root_path)
            end
        end
    end
end

