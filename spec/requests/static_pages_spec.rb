require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Unlimited Blade Work'" do
      visit '/static_pages/home'
      page.should have_content('Unlimited Blade Work')
    end

    it "should have the title 'Chant'" do
      visit '/static_pages/home'
      page.should have_selector('title',:text => " | Chant")
    end
  end

  describe "Help page" do

    it "should have the content 'Mana is sufficient'" do
      visit '/static_pages/help'
      page.should have_content('Mana is sufficient')
    end

    it "should have the title 'Manual'" do
      visit '/static_pages/help'
      page.should have_selector('title',:text => " | Manual")
    end
  end

  describe "About page" do

    it "should have the content 'Servant Information'" do
      visit '/static_pages/about'
      page.should have_content('Servant Information')
    end

		it "should have the title 'Information'" do
			visit '/static_pages/about'
			page.should have_selector('title',:text => " | Information")
		end
  end  
end
