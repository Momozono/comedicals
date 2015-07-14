require 'spec_helper'

describe 'static_pages' do
	describe 'Home page' do
		before  {visit root_path}
		subject {page}
		it {should have_content('Fragment')}
		it {should have_title('Fragment')}
		it {should_not have_title('|')}
	end

	describe 'About Page' do
		before {visit about_path}
		subject {page}
		it {should have_content('Fragment')}
		it {should have_title('Fragment | About')}
	end

	describe 'Help Page' do
		before {visit help_path}
		subject {page}
		it {should have_content('Fragment')}
		it {should have_title('Fragment | Help')}
	end

	describe 'Sign in page' do
		before {visit signin_path}
		subject {page}
		it {should have_content('Fragment')}
		it {should have_title('Sign in')}
	end
end




