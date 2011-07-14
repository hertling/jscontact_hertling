require 'spec_helper'


describe "the views for people", :type => :request do
  context "when listing the people" do
    before(:each) do
      @person1 = Fabricate(:person)
      @person2 = Fabricate(:person)
      visit people_path     
    end
    it "should list the phone numbers" do
      [@person1, @person2].each do |person|
        person.phone_numbers.each do |phone_number|
          page.should have_content(phone_number.number)
        end
      end
    end
  end
  context "when looking at a person" do
    before(:each) do
      @person=Fabricate(:person)
      visit person_path(@person)   
    end
    
    it "should display each phone number" do
      @person.phone_numbers.each do |n|
        # Check that the number's number is on the page.
        page.should have_content(n.number)
      end
    end
    
    it "should have edit links for each phone number" do
      @person.phone_numbers.each do |phone_number|
        #save_and_open_page        
        page.should have_link(dom_id(phone_number, :edit), :href => edit_phone_number_path(phone_number))
      end
    end
    
    it "should have a delete link for each phone number" do
      @person.phone_numbers.each do |phone_number|
        # Check that the number's number is on the page.
        page.should have_link(dom_id(phone_number, :delete), :href => phone_number_path(phone_number))
      end
    end
    
    context "when I click the delete link for a number" do
      before(:each) do
        @number=@person.phone_numbers.first
        page.click_link(dom_id(@number, :delete))
      end      
      it "should display the person show page" do
        current_path.should == people_path  
      end
      
      it "should not display the deleted number" do
        page.should_not have_content(@number.number)
      end
    end
    
    context "when I click the Add a Phone Number link" do
      before(:each) do
        @person.phone_numbers.first
        page.click_link(dom_id(@person.phone_numbers.new))
      end      
      it "should display the new phone number page" do
        current_path.should == new_phone_number_path
      end
    end
    
    context "when I click on the edit link for a number" do
      before(:each) do
        @number=@person.phone_numbers.first
        page.click_link(dom_id(@number, :edit))
      end
      
      it "should show the edit form" do
        current_path.should == edit_phone_number_path(@number)
      end 
    end
  end 

end