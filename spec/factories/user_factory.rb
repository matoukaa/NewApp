FactoryGirl.define do 
	sequence(:email) { |n| "user#{n}@example.com" }

	factory :user do
		first_name "Joe"
		last_name "Smith"
		email
		password "testing"
		admin false
	end

	factory :admin, class: User do
		first_name "Ben"
		last_name "Admin"
		email
		password "12345"
		admin true
	end
end