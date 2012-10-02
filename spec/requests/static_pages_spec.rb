require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Unlimited Blade Work'" do
      visit '/static_pages/home'
      page.should have_content('Unlimited Blade Work')
    end
  end

  describe "Help page" do

    it "should have the content 'Mana is sufficient'" do
      visit '/static_pages/help'
      page.should have_content('Mana is sufficient')
    end
  end

  describe "About page" do

    it "should have the content 'Servant Information'" do
      visit '/static_pages/about'
      page.should have_content('Servant Information')
    end
  end
end
