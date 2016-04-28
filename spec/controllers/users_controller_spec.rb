require 'rails_helper'

describe UsersController, :type => :controller do

	before do
		#@user = User.create!(email: "testing@gmail.com", password: "testtest")
		@user = FactoryGirl.create(:user)
		@user2 = User.create!(email: "test2@gmail.com", password: "testtest2")
	end

	describe "GET #show" do
		context "If user is logged in" do
			before do
				sign_in @user
			end

			it "loads correct user details of User" do
				get :show, id: @user
				expect(response.status).to eq 200
				expect(assigns(:user)).to eq @user
			end

			it "won't load incorrect details of user 2" do
				get :show, id: @user
				expect(response.status).to eq 302
				expect(response).to redirect_to(root_path)
			end
		end

		context "No user is logged in" do
			it "redirects to login" do
				get :show, id: @user
				expect(response).to redirect_to(root_path)
			end
		end
		
	end
end