module HostConnect
  class GetBookingPaymentSummaryBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password, :booking_id ].freeze
      super(options)
    end

    def to_xml
      x = bare
      x.Request {
        x.GetBookingPaymentSummaryRequest {
          x.AgentID @agent_id
          x.Password @password
          x.BookingId @booking_id
        }
      }
      x
    end
  end
end
