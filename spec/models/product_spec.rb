require 'rails_helper'

describe Product do

		context "when the product has comments" do
		before do
			@product = Product.create!(name: "floral shirt")
			@user = User.create!(email: "test@gmail.com", password: "testing")
			@product.comments.create!(rating: 1, user: @user, body: "Terrible.")
			@product.comments.create!(rating: 3, user: @user, body: "OK.")
			@product.comments.create!(rating: 5, user: @user, body: "Great!")
		end

		it "returns average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end

		it "product is not valid" do
			expect(Product.new(description: "Great!")).not_to be_valid
		end

		it "product is not valid" do
			expect(Product.new(price: "")).not_to be_valid
		end
	end
end