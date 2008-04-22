require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::OptionInfoBuilder do
  before(:each) do
  end
  
  it "should return xml for hotel search" do
    @xml = File.read("./spec/fixtures/requests/option_info/hotel_search.xml")
    
    req = OptionInfoBuilder.new(
      :agent_id => "EURTAT",
      :password => "EURTAT",
      :opt => "LONAC????????????",
      :date_from => "2007-10-01",
      :info => "GNRI"
    )
    
    req.to_s.should == @xml
  end
  
  it "should return xml for hotel search with a room config (total stay price)" do
    @xml = File.read("./spec/fixtures/requests/option_info/hotel_search_total_stay_price.xml")
    
    room = RoomConfigBuilder.new(:adults => 2, :room_type => "TW")
    req = OptionInfoBuilder.new(
      :agent_id => "EURTAT",
      :password => "EURTAT",
      :opt => "LONAC????????????",
      :info => "GS",
      :room_config => room,
      :date_from => "2007-10-03",
      :date_to => "2007-10-06"
    )
    
    req.to_s.should == @xml
  end
  
  it "should return xml for option number search" do
    @xml = File.read("./spec/fixtures/requests/option_info/option_number.xml")
    
    req = OptionInfoBuilder.new
    req.agent_id = "EURTAT"
    req.password = "EURTAT"
    req.option_number = [10, 15]
    
    req.to_s.should == @xml
  end
end
