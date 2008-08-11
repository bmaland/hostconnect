require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::AddServiceBuilder do
  before(:each) do
    @xml = File.read("./spec/fixtures/requests/add_service_request/hotel_booking.xml")
  end

  it "should produce xml" do
    req = AddServiceBuilder.new(:agent_id => "EURTAT", :password => "EURTAT")

    req.new_booking_info = NewBookingInfoBuilder.new(:name => "Jessop Mr/Mrs", :qb => "B")

    pax1 = PaxDetailsBuilder.new(:title => "Mr", :forename => "Rob",
                                 :surname => "Jardim", :pax_type => "A",
                                 :date_of_birth => "1980-12-24")
    pax2 = PaxDetailsBuilder.new(:title => "Mrs", :forename => "Sally",
                                 :surname => "Jardim", :pax_type => "A",
                                 :date_of_birth => "1980-12-24")

    room = RoomConfigBuilder.new(:adults => 2, :room_type => "TW",
                                 :pax_list => [ pax1, pax2 ])
    req.room_configs = [ room ]

    req.opt = "LONACCUMLONSTDBCB"
    req.date_from = "2007-10-07"
    req.scu_qty = "2"

    req.ud_text1 = "+4799999999"
    req.ud_text2 = "contact@email.net"
    req.ud_text3 = "Norway"
    req.ud_text4 = false
    req.ud_text5 = "Smoking"

    req.to_s.should == @xml
  end
end
