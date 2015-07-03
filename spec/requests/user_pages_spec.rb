require 'spec_helper'

describe "User Pages" do
	it "should have the content'Fragment'" do
		visit signup_path
		  expect(page).to have_content('Fragment')
	end
	it "should have the title 'Signup'" do
		visit signup_path
		expect(page).to have_title('Signup')
	end
end




