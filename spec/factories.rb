FactoryGirl.define do
	factory :user do
		sequence(:name)				{ |n| "Person #{n}" }
		sequence(:email)			{ |n| "Person_#{n}@example.com" }
		password 							"w0rdpass"
		password_confirmation "w0rdpass"

		factory :admin do
			admin true
		end
	end
end
