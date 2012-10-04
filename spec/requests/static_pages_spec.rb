require 'spec_helper'

describe "Static pages" do

	let(:base_title) { "ARCHER" }

	subject { page }

  describe "Home page" do
		before {visit root_path}

    it { should have_content('Unlimited Blade Work') }

		it { should have_selector('title', text: full_title('')) }
  end

  describe "Help page" do
		before {visit help_path}

    it { should have_content('Mana is sufficient') }

    it { should have_selector('title', text: full_title('Manual')) }
  end

  describe "About page" do
		before {visit about_path}

    it { should have_content('Servant Information') }

		it { should have_selector('title', text: full_title('Information')) }
  end

	describe "Contact page" do
		before {visit contact_path}

		it { should have_selector('h1', text: "Servant Skill") }

		it { should have_selector('title', text: "#{base_title} | Skill") }
	end
end
