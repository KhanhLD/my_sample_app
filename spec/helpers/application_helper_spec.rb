require 'spec_helper'

describe ApplicationHelper do

	describe "full_title" do
		it "should include the page title" do
			full_title("page_title").should =~ /page_title/
		end

		it "should include the base title" do
			full_title("page_title").should =~ /^ARCHER/
		end

		it "should not include a bar for home page" do
			full_title("").should_not =~ /\|/
		end
	end
end
