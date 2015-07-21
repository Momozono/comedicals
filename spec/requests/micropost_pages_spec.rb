require 'spec_helper'

describe "MicropostPages" do

  subject {page}
  let(:user) {FactoryGirl.create(:user)}
  before { sign_in user }

  describe "micropost creation" do
    before {visit root_path}
=begin

      describe "with invalid information" do
        it "should not create micropost" do
          expect { click_button "Post" }.not_to change(Micropost, :count)
        end
=end
=begin
        describe "error messages" do
          before {click_button "Post"}
          it "should have error element" do
            expect(page).to have_content('error')
          end
        end
      end
=end

      describe "with valid information" do
        before { fill_in 'micropost_content', with: "hogehoge foobar!!!" }
        it "should create micropost" do
          expect {click_button "Post"}.to change(Micropost, :count)
        end
      end
  end
end
