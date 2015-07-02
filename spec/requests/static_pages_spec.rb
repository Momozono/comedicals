require 'spec_helper'


describe 'static_pages' do

	describe 'Home page' do
		it "should have the content 'Fragment'" do
			visit '/static_pages/home'
			expect(page).to have_content ('Fragment')
		end
		it "should have the title 'Home'" do
			visit '/static_pages/home'
				expect(page).to have_title('Fragment')
		end
		it "should not have the title" do
			visit '/static_pages/home'
			expect(page).not_to have_title('|')
		end
　 end

	describe 'About Page' do
		it "should have the content 'Fragment'" do
			visit '/static_pages/about'
			expect(page).to have_content('Fragment')
		end
		it "should have the title 'About'" do
			visit '/static_pages/about'
			expect(page).to have_title('Fragment | About')
		end
	end

	describe 'Help Page' do
		it "should have the content 'Fragment'" do
			visit '/static_pages/help'
			expect(page).to have_content('Fragment')
		end
		it "should have the title 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_title('Fragment | Help')
		end
	end

end




