require 'spec_helper'

describe "MicropostPages" do
  subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { valid_signin user }

	describe "micropost destruction" do
		before { FactoryGirl.create(:micropost, user: user) }

		describe "correct user" do
			before { visit root_path }

			it "should delete a micropost" do
				expect { click_link "delete" }.to change(Micropost, :count).by(-1)
			end
		end
	end

	describe "micropost creation" do
		before { visit root_path }

		describe "invalid information" do
			it "should not create a micropost" do
				expect { click_button "Post" }.not_to change(Micropost, :count)
			end

			describe "error messages" do
				before { click_button "Post" }
				it { should have_content('error') }
			end
		end

		describe "valid information" do
			before { fill_in 'micropost_content', with: "Lorem ipsum" }
			it "should create a micropost" do
				expect { click_button "Post" }.to change(Micropost, :count).by(1)
			end
		end
	end
end
