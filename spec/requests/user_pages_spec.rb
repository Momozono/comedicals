require 'spec_helper'


describe "User Pages" do
	subject {page}

	describe "profile page" do #Sign inした時
		let(:user){FactoryGirl.create(:user)}
		before {visit user_path(user)}

		it {should have_content(user.name)}
		it {should have_title(user.name)}
	end

  describe "signup page" do #Sign inしてない時
  	
	  before  {visit signup_path}
	  it {should have_content('Fragment')}
	  it {should have_title(generate_title('Signup')) }
  end
end







