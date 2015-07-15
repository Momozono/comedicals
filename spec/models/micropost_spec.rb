require 'spec_helper'

describe "Micropost model" do
  let(:user) {FactoryGirl.create(:user)}
  before  { @micropost = user.microposts.build(content: "foobar") }
  subject { @micropost }
    it { should respond_to(:content) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }

    describe "return right user object" do
      its(:user) { should eq user }
    end

    describe "with content" do
      describe "when content is blank" do
        before { @micropost.content = nil }
          it { should_not be_valid }
        end

      describe "when content is too long" do
        before { @micropost.content = "a" * 501 }
        it { should_not be_valid }
      end
    end

    describe "when user_id is blank" do
      before { @micropost.user_id = nil }
      it { should_not be_valid }
    end
end

