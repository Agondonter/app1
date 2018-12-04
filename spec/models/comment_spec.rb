require 'rails_helper'
# describe(:class)
# context "state"
# let(:class) { method(Instance variable) }
# it "test"
# expect(method).matchers "result"
describe Comment do
  context 'when a user leaves a comment' do
  	before do
  	  @user = FactoryBot.create(:user)
  	  @product = FactoryBot.create(:product)
  	end
  	let(:comment) {Comment.create(user_id: @user.id, product_id: @product.id, body: "Example", rating: 5)}
  	
  	it 'is not valid without a body' do
  	  comment.body = nil
  	  expect(comment).not_to be_valid
  	end

  	it 'is not valid without a rating' do
  	  comment.rating = nil
  	  expect(comment).not_to be_valid
  	end

  	it 'is not valid without a product' do
  	  comment.product_id = nil
  	  expect(comment).not_to be_valid
  	end 

  	it 'is not valid without a user' do
  	  comment.user_id = nil
  	  expect(comment).not_to be_valid
  	end

  	it 'is valid when all parameters are present' do
  	  expect(@product.comments.new(user_id: @user.id, product_id: @product.id, body: "Example", rating: 5)).to be_valid
  	end
  end
end