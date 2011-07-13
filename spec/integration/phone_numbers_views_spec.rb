require 'spec_helper'

describe "the views for phone numbers", :type => :request do
  before(:each) do
    @person = Fabricate(:person)    
    visit person_path(@person)   
  end
  context "when on the edit form" do
    before(:each) do
      @phone_number=@person.phone_numbers.first
      visit edit_phone_number_path(@phone_number)
    end
    it "should show the person after clicking the update button" do
      click_link_or_button("phone_number_submit")
      current_path.should == people_path
    end
  end
end