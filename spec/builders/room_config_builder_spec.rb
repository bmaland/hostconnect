require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::RoomConfigBuilder do
  it "should produce xml" do
    @room_xml_1 = <<-END
      <RoomConfig>
        <Adults>1</Adults>
        <RoomType>TW</RoomType>
        <PaxList>
          <PaxDetails>
            <Title>Mr</Title>
            <Forename>Rob</Forename>
            <Surname>Jardim</Surname>
            <DateOfBirth>1980-12-24</DateOfBirth>
            <PaxType>A</PaxType>
          </PaxDetails>
        </PaxList>
      </RoomConfig>
END

    @room_xml_2 = <<-END
      <RoomConfig>
        <Adults>2</Adults>
        <RoomType>TW</RoomType>
        <PaxList>
          <PaxDetails>
            <Title>Mr</Title>
            <Forename>Rob</Forename>
            <Surname>Jardim</Surname>
            <DateOfBirth>1980-12-24</DateOfBirth>
            <PaxType>A</PaxType>
          </PaxDetails>
          <PaxDetails>
            <Title>Mrs</Title>
            <Forename>Sally</Forename>
            <Surname>Jardim</Surname>
            <DateOfBirth>1980-12-24</DateOfBirth>
            <PaxType>A</PaxType>
          </PaxDetails>
        </PaxList>
      </RoomConfig>
END

    pax1 = PaxDetailsBuilder.new(:title => "Mr", :forename => "Rob", :surname => "Jardim",
      :pax_type => "A", :date_of_birth => "1980-12-24")
    pax2 = PaxDetailsBuilder.new(:title => "Mrs", :forename => "Sally", :surname => "Jardim",
      :pax_type => "A", :date_of_birth => "1980-12-24")

    room = RoomConfigBuilder.new(:adults => 1, :room_type => "Twin", :pax_list => [ pax1 ])
    room.to_s.should == @room_xml_1

    room = RoomConfigBuilder.new(:adults => 2, :room_type => "Twin", :pax_list => [ pax1, pax2 ])
    room.to_s.should == @room_xml_2
  end

  it "should return a XML Builder object" do
    room = RoomConfigBuilder.new
    room.to_xml.should_be_an_instance_of Builder::XmlMarkup
  end
end
