require 'spec_helper'

describe "Authentication" do
	subject {page}

	describe "signin page" do #まだSign inしてない時
		before {visit signin_path}
		it {should have_content('Sign in')}
		it {should have_title('Sign in')}
	end

	describe "signin" do
		before {visit signin_path}
		  
		  describe "with invalid information" do #間違った情報を入力したとき
			  before {click_button "Sign in"}
		    it {should have_title('Sign in')}
		    it {should have_selector('div.alert.alert-error', text: 'Invalid')}
	    end

	    describe "with valid information" do
	    	let(:user) {FactoryGirl.create(:user)}
	    	before {sign_in user}
=begin
	    	  before do
	    		  fill_in "Email",     with: user.email.upcase
	    		  fill_in "Password",  with: user.password
	    		  click_button "Sign in"
	    	  end
=end
	    	  it {should have_title(user.name)}
	    	  it {should have_link('Profile', href: user_path(user))}
	    	  it {should have_link('Settings', href: edit_user_path(user))}
	    	  it {should have_link('Sign out', href: signout_path)}
	    	  it {should_not have_link('Sign in', href: signin_path)}

	      describe "signout" do
	      	before {visit user_path(user)}
	    	  before {click_link "Sign out"}
	    	  it {should have_link('Sign in')}
	    	  it {should_not have_link('Account')}
	    	  it {should_not have_link('Profile')}
	    	  it {should_not have_link('Sign out')}
	      end
	    end
  end
end



