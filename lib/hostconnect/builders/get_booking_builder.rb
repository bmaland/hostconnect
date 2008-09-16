module HostConnect
  # This request retrieves a booking. Note that for a booking to be retrieved
  # successfully the agent requesting the booking must be the same as the agent
  # who made the booking.
  class GetBookingBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password, :booking_id, :ref ].freeze
      super(options)
    end

    def to_xml
      x = bare
      x.Request {
        x.GetBookingRequest {
          x.AgentID @agent_id
          x.Password @password
          x.BookingId @booking_id if @booking_id
          x.Ref @ref if @ref
        }
      }
      x
    end
  end
end
