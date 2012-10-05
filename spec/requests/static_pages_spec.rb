require 'spec_helper'

describe "Static pages" do

	subject { page }

	shared_examples_for "all static pages" do
		it {should have_selector('h1', text: heading)}
		it {should have_selector('title', text: full_title(page_title))}
	end

  describe "Home page" do
		before {visit root_path}
		let (:heading) {"Chant"}
		let (:page_title) {""}

    it_should_behave_like "all static pages"
		it {should_not have_selector('title', text: " | Home")}
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

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		page.should have_selector('title', text: full_title("Information"))
		click_link "Help"
		page.should have_selector('title', text: full_title("Manual"))
		click_link "Contact"
		page.should have_selector('title', text: full_title("Skill"))
		click_link "Home"
		click_link "Sign up now"
		page.should have_selector('title', text: full_title("Sign up"))
		click_link "holy grail war"
		page.should have_selector('title', text: full_title(""))
	end
end
