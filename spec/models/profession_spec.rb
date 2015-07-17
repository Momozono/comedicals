require 'spec_helper'

describe Profession do

  before do
    @profession = Profession.new(profession_name: "doctor")
  end
  it "should have the right atttribute" do
    expect(@profession).to respond_to(:profession_name)
  end

  it "should not be blank profession_name" do
    @profession.profession_name = nil
    expect(@profession).to be_invalid
  end
end