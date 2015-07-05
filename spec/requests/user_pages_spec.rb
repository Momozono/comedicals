require 'spec_helper'

describe "User Pages" do
	before  {visit signup_path}
	subject {page}
	it {should have_content('Fragment')}
	it {should have_title('Signup')}
end



