require 'rails_helper'

describe ProductsController, type: :controller do
  before do
  	@product = FactoryBot.create(:product)
  	@user = FactoryBot.create(:user)
  	@admin = FactoryBot.create(:user, admin: true)
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
  	it 'renders products page' do
  	  get :show, params: {id: @product}
  	  expect(response).to be_ok
    end
  end

  describe 'GET #new' do
  	before do
  	  sign_in @admin
  	end
  	it 'redirects to new product form' do
  	  get :new, params: {id: @product}
  	  expect(response).to be_ok
  	end
  end

   describe 'GET #edit' do
  	before do
  	  sign_in @admin
  	end
  	it 'redirects to edit product form' do
  	  get :edit, params: {id: @product}
  	  expect(response).to be_ok
  	end
  end 

  describe 'POST #create' do
    before do
      sign_in @admin
    end
    it 'creates a new product' do
      @product = FactoryBot.create(:product)
      expect(response).to be_ok
    end
    it 'fails to create a new product' do
      expect(Product.new).not_to be_valid
    end
  end 

  describe 'PATCH #update' do
  	before do
  	  sign_in @admin
  	  @product = FactoryBot.create(:product)
  	end
  	it 'updates product' do
  	  product_params = FactoryBot.attributes_for(:product)
      expect{patch :update, params: {id: @product.id, product: product_params}
      }.to change(Product, :count).by(0)
  	  expect(flash[:notice]).to eq 'Product was successfully updated.'
  	end
  end

  describe 'DELETE #destroy' do
  	before do
  	  sign_in @admin
  	  @product = FactoryBot.create(:product)
  	end
  	it 'deletes product' do
      delete :destroy, params: {id: @product.id}
      expect(flash[:notice]).to eq 'Product was successfully destroyed.'
    end
  end
end