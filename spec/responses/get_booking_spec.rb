require File.dirname(__FILE__) + "/../spec_helper"

describe HostConnect::GetLocations do
  before(:each) do
    response = File.read("./spec/fixtures/responses/get_booking.xml")
    @booking = GetBooking.new(response)
  end

  it "should return an object with attributes set from the response" do
    @booking.booking_id.should == 6051
    @booking.ref.should == "ASIN100102"
    @booking.booking_update_count.should == 61
    @booking.name.should == "Jessop Mr/Mrs"
    @booking.qb.should == "B"
    @booking.email.should == "Test av kontaktinfo"
    @booking.travel_date.to_s.should == "2008-10-08"
    @booking.entered_date.to_s.should == "2008-07-30"
    @booking.booking_status.should == "Internet Booking"
    @booking.read_only.should be_false
    @booking.is_internet_booking?.should be_true
    @booking.currency.should == "EUR"
    @booking.total_price.should == 1318
  end
end
