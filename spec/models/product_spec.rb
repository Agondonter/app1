require 'rails_helper'

describe Product do 
  context "when the product has comments" do
  	before do
     @product = FactoryBot.create(:product)
     @user1 = FactoryBot.create(:user)
    end

    before do
     @product.comments.create!(rating: 1, user: @user1, body: "Terrible!")
     @product.comments.create!(rating: 5, user: @user1, body: "Astonishing!")
     @product.comments.create!(rating: 3, user: @user1, body: "Nice!")
    end
      
      it "returns the average rating of all comments" do
        expect(@product.average_rating).to eq 3
      end

      it "is not valid without a name" do
        expect(Product.new(description: "A collection of calm music suitable for relaxation")).not_to be_valid 
      end
  end
end
