require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::PaxDetailsBuilder do
  before(:each) do
    @pax_xml = <<-END
<PaxDetails>
  <Title>Mr</Title>
  <Forename>Rob</Forename>
  <Surname>Jardim</Surname>
  <PaxType>A</PaxType>
</PaxDetails>
END
  end
  
  it "should return pure xml with the to_s method" do
    pax = PaxDetailsBuilder.new(:title => "Mr", :forename => "Rob", :surname => "Jardim",
      :pax_type => "A")
    
    pax.to_s.should == @pax_xml
  end
  
  it "should be possible to set and change the attributes directly" do
    pax = PaxDetailsBuilder.new
    pax.title = "Mr"
    pax.forename = "Rob"
    pax.surname = "Jardim"
    pax.pax_type = "A"
    
    pax.to_s.should == @pax_xml
    
    pax.forename = "Pete"
    pax.to_s.should_not == @pax_xml
  end
  
  it "should return a XML Builder object" do
    pax = PaxDetailsBuilder.new({})
    pax.to_xml.should respond_to(:target!)
  end
end
