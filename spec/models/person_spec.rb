require File.dirname(__FILE__) + '/../spec_helper'

describe Person do
  before(:all) do
    # Runs ONCE (total) before all tests
  end
  before(:each) do
    @person = Person.new(:first_name => 'Daffy', :last_name => 'Duck')
    # Runs once before each of the tests
  end
  
  it "should be valid" do
    @person.should be_valid
  end
  it "should not be valid without a first name" do
    @person.first_name=nil
    @person.should_not be_valid #basically like (person.valid?==true)
  end
  
  it "should not be valid without a last name" do
    @person.last_name=nil
    @person.should_not be_valid #basically like (person.valid?==true)
  end
  
  it "should have an array of phone numbers" do
    @person.phone_numbers.should be_instance_of(Array)
  end    
  
end
