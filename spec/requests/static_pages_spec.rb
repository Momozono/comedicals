require 'spec_helper'

describe 'static_pages' do
  describe 'Home page' do
    before  {visit root_path}
    subject {page}
    it {should have_content('Comedicals')}
    it {should have_title('Comedicals')}
    it {should_not have_title('|')}

    describe "for signed-in user" do
      let(:user) {FactoryGirl.create(:user)}
      before do
        FactoryGirl.create(:micropost, user: user, content: "foobar!")
        FactoryGirl.create(:micropost, user: user, content: "hogehoge!")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end

  describe 'About Page' do
    before {visit about_path}
    subject {page}
    it {should have_content('Comedicals')}
    it {should have_title('Comedicals | About')}
  end

  describe 'Help Page' do
    before {visit help_path}
    subject {page}
    it {should have_content('Comedicals')}
    it {should have_title('Comedicals | Help')}
  end

  describe 'Sign in page' do
    before {visit signin_path}
    subject {page}
    it {should have_content('Comedicals')}
    it {should have_title('Sign in')}
  end
end




