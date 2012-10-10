namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(name: "example user", email: "example@railstutorial.com", 								password: "password", password_confirmation: "password")
		99.times do |n|
			name = Faker::Name.name
			email = "user-#{n+1}@railstutorial.com"
			password = "password"
			User.create!(name: name, email: email, password: password, 										password_confirmation: password)
		end
	end
end
