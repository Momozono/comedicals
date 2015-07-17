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

       let(:submit) { "Create my account" }

    describe "signup with invalid information" do
      it "should be invalid" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "signup with valid information" do
        before do
            fill_in "Name",                  with: "Example Name"
            fill_in "Email",                 with: "foobar@example.com"
            fill_in "Password",              with: "foobar"
            fill_in "Confirmation", with: "foobar"
        end
      it "should be valid" do
        expect { click_button submit }.to change(User, :count)
      end
    end
  end

  describe "edit page" do
    let(:user){FactoryGirl.create(:user)}
    before do
        sign_in user
      visit edit_user_path(user)
    end

    it {should have_content('Edit your profile!')}
    it {should have_title('Edit')}
    it {should have_button('Save')}

    describe "with valid information" do
        let(:new_name) {"New Name"}
        let(:new_email){"new@example.com"}
        before do
            fill_in 'Name',         with: new_name
            fill_in 'Email',        with: new_email
            fill_in 'Password',     with: user.password
            fill_in 'Confirmation', with: user.password
            click_button 'Save'
        end
        it {should have_title(new_name)}
        it {should have_selector('div.alert.alert-success')}
        it {should have_content('updated')}
        it {should have_link('Home', href: '/')}
        it {should have_link('Help', '/help')}
        it {should have_link('Sign out')}

        specify {expect(user.reload.name).to  eq new_name }
        specify {expect(user.reload.email).to eq new_email}
    end


  end
end





