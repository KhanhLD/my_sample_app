require 'spec_helper'

describe "Static pages" do

	subject { page }

	shared_examples_for "all static pages" do
		it {should have_selector('h1', text: heading)}
		it {should have_selector('title', text: full_title(page_title))}
	end

  describe "Home page" do
		before {visit root_path}

		it {should_not have_selector('title', text: " | Home")}

		describe "signed in users" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
				FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
				valid_signin user
				visit root_path
			end

			it "should render the user's feed" do
				user.feed.each do |item|
					page.should have_selector("li##{item.id}", text: item.content)
				end
			end
		end
  end

  describe "Help page" do
		before {visit help_path}
		let (:heading) {"Manual"}
		let (:page_title) {"Manual"}
		
		it_should_behave_like "all static pages"
  end

  describe "About page" do
		before {visit about_path}
		let (:heading) {"Information"}
		let (:page_title) {"Information"}

		it_should_behave_like "all static pages"
  end

	describe "Contact page" do
		before {visit contact_path}
		let (:heading) {"Skill"}
		let (:page_title) {"Skill"}

		it_should_behave_like "all static pages"
	end
end
