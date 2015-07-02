require 'spec_helper'

describe 'static_pages' do
	describe 'Home page' do 
		it "should have the content 'Fragment'" do
			visit '/static_pages/home'
			expect(page).to have_content ('Fragment')
		end
	end
end




