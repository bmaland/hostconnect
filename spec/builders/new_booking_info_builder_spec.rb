require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::NewBookingInfoBuilder do
  before(:each) do
    @xml = <<-END
    <NewBookingInfo>
      <Name>Jessop Mr/Mrs</Name>
      <QB>B</QB>
    </NewBookingInfo>
END
  end
  
  it "should produce correct xml" do
    req = NewBookingInfoBuilder.new(:name => "Jessop Mr/Mrs", :qb => "B")
    
    req.to_s.should == @xml
  end
  
  it "should be possible to set and change the attributes directly" do
    req = NewBookingInfoBuilder.new
    req.name = "Jessop Mr/Mrs"
    req.qb   = "B"
    
    req.to_s.should == @xml
    
    req.qb = "X"
    req.to_s.should_not == @xml
  end
  
  it "should return a XML Builder object" do
    req = NewBookingInfoBuilder.new({})
    req.to_xml.should respond_to(:target!)
  end
end
