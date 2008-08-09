require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::GetSystemSettings do
  before(:each) do
    response = File.read("./spec/fixtures/responses/get_system_settings.xml")
    @system_settings = GetSystemSettings.new(response)
  end

  it "should return an object with attributes set from the response" do
    @system_settings.quotes_enabled.should be_false
    @system_settings.quotes_are_default.should be_false
    @system_settings.is_agent_dialogue_enabled.should be_false
  end

  it "should include an array with countries and destinations" do
    @system_settings.countries.size.should == 1
    @system_settings.countries[0].country_name.should == "(Unspecified)"
    @system_settings.countries[0].destination_names.size.should == 10
    @system_settings.countries[0].destination_names[0].destination_name.should == "Abu Dhabi"
  end
end
