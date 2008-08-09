module HostConnect
  class GetBooking < AbstractResponse
    private
    def populate
      set_attrs

      @services = []
      @data.search("/Reply/GetBookingReply/Services/Service").each do |service|
        s = Struct.new(:service_line_id, :service_line_update_count, :opt).new
        s.service_line_id = (service/"ServiceLineId").innerHTML.to_i
        s.service_line_update_count = (service/"ServiceLineUpdateCount").innerHTML.to_i
        s.opt = (service/"Opt").innerHTML

        @services << s
      end
    end
  end
end
