require 'spec_helper'


describe 'static_pages' do

	describe 'Home page' do
		it "should have the content 'Fragment'" do
			visit root_path
			expect(page).to have_content ('Fragment')
		end
		it "should have the title 'Home'" do
			visit root_path
				expect(page).to have_title('Fragment')
		end
		it "should not have the title" do
			visit root_path
			expect(page).not_to have_title('|')
		end
  end

	describe 'About Page' do
		it "should have the content 'Fragment'" do
			visit about_path
			expect(page).to have_content('Fragment')
		end
		it "should have the title 'About'" do
			visit about_path
			expect(page).to have_title('Fragment | About')
		end
	end

	describe 'Help Page' do
		it "should have the content 'Fragment'" do
			visit help_path
			expect(page).to have_content('Fragment')
		end
		it "should have the title 'Help'" do
			visit help_path
			expect(page).to have_title('Fragment | Help')
		end
	end

	describe 'Sign in page' do
		it "should have the content'Fragment'" do
			visit signin_path
			expect(page).to have_content('Fragment')
		end
		it "should have the title 'Signin'" do
			visit signin_path
			expect(page).to have_title('Signin')
		end
	end
end




