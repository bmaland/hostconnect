require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::RoomConfigBuilder do
  it "should produce xml" do
    @room_xml_1 = <<-END.margin
    <RoomConfig>
      <Adults>1</Adults>
      <RoomType>TW</RoomType>
      <PaxList>
    <PaxDetails>
      <Title>Mr</Title>
      <Forename>Rob</Forename>
      <Surname>Jardim</Surname>
      <PaxType>A</PaxType>
    </PaxDetails>
      </PaxList>
    </RoomConfig>
END

    @room_xml_2 = <<-END.margin
    <RoomConfig>
      <Adults>2</Adults>
      <RoomType>TW</RoomType>
      <PaxList>
    <PaxDetails>
      <Title>Mr</Title>
      <Forename>Rob</Forename>
      <Surname>Jardim</Surname>
      <PaxType>A</PaxType>
    </PaxDetails>
    <PaxDetails>
      <Title>Mrs</Title>
      <Forename>Sally</Forename>
      <Surname>Jardim</Surname>
      <PaxType>A</PaxType>
    </PaxDetails>
      </PaxList>
    </RoomConfig>
END

    pax1 = PaxDetailsBuilder.new(:title => "Mr", :forename => "Rob", :surname => "Jardim",
      :pax_type => "A")
    pax2 = PaxDetailsBuilder.new(:title => "Mrs", :forename => "Sally", :surname => "Jardim",
      :pax_type => "A")
    
    room = RoomConfigBuilder.new(:adults => 1, :room_type => "TW", :pax_list => pax1)
    room.to_s.chomp.should == @room_xml_1.chomp
    
    room = RoomConfigBuilder.new(:adults => 2, :room_type => "TW", :pax_list => [pax1, pax2])
    room.to_s.chomp.should == @room_xml_2.chomp    
  end
  
  it "should return a XML Builder object" do
    room = RoomConfigBuilder.new({})
    room.to_xml.should respond_to(:target!)
  end
end
