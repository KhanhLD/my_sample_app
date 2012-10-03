require 'spec_helper'

describe "Static pages" do

	let(:base_title) { "ARCHER" }

  describe "Home page" do

    it "should have the content 'Unlimited Blade Work'" do
      visit '/static_pages/home'
      page.should have_content('Unlimited Blade Work')
    end

		it "should have the base title" do
			visit '/static_pages/home'
			page.should have_selector('title',:text => "#{base_title}")
		end
  end

  describe "Help page" do

    it "should have the content 'Mana is sufficient'" do
      visit '/static_pages/help'
      page.should have_content('Mana is sufficient')
    end

    it "should have the title 'Manual'" do
      visit '/static_pages/help'
      page.should have_selector('title',:text => "#{base_title} | Manual")
    end
  end

  describe "About page" do

    it "should have the content 'Servant Information'" do
      visit '/static_pages/about'
      page.should have_content('Servant Information')
    end

		it "should have the title 'Information'" do
			visit '/static_pages/about'
			page.should have_selector('title',:text => "#{base_title} | Information")
		end
  end

	describe "Contact page" do
		
		it "should have the h1 'Servant Skill'" do
			visit '/static_pages/contact'
			page.should have_selector('h1',:text => "Servant Skill")
		end

		it "should have the title 'Skill'" do
			visit '/static_pages/contact'
			page.should have_selector('title',:text => "#{base_title} | Skill")
		end
	end
end
