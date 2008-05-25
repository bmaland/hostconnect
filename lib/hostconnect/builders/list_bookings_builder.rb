module HostConnect
  # The ListBookings request returns header-level details of zero or
  # more bookings made by the specifed agent, and that meet all of the
  # criteria specified. If a sub-login is supplied then only details of
  # bookings associated with that sub-login are returned.
  class ListBookingsBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password, :travel_date_from, :travel_date_to,
                         :entered_date_from, :entered_date_to, :name_contains,
                         :agent_ref ].freeze
      super(options)
    end
    
    def to_xml
      x = bare
      x.Request {
        x.ListBookingsRequest {
          @valid_options.each do |opt|
            val = eval "#{opt}"
            eval "x.#{opt.camelize.requestify} #{opt}" unless val.blank?
          end
        }
      }
      x
    end
  end
end
