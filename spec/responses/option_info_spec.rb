require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::OptionInfo do
  it "should have means for displaying number of hits from a hotel search" do
    @response = File.read("./spec/fixtures/responses/option_info/hotel_search.xml")
    option_info = OptionInfo.new(@response)
    option_info.size.should == 9
  end
  
  it "should be possible to display the last element" do
    @response = File.read("./spec/fixtures/responses/option_info/hotel_search.xml")
    option_info = OptionInfo.new(@response)
    last = option_info.last
    last.opt.should == "LONACCUMLONSTDBCB"
  end
  
  it "should be possible to display the first element" do
    @response = File.read("./spec/fixtures/responses/option_info/hotel_search.xml")
    option_info = OptionInfo.new(@response)
    first = option_info.first
    first.opt.should == "LONACHOINKCSTDBEB"
  end
end
