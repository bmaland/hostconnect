module HostConnect
  # A booking is built up service by service. Each AddService request adds one
  # service to a (new or existing) booking. Note that for a service to be added
  # to an existing booking the agent adding the service must be the same as the
  # agent who made the original booking.
  class AddServiceBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password, :new_booking_info, :opt, :date_from,
                         :scu_qty, :room_configs ].freeze
      super(options)
    end
    
    def to_xml
      x = bare
      x.Request {
        x.AddServiceRequest { |i|
          x.AgentID @agent_id
          x.Password @password
          
          if @new_booking_info
            i << @new_booking_info.to_xml.target!
          end
          
          if @room_configs
            # Stack the room configs onto the request
            x.RoomConfigs { |i|
              @room_configs.each { |room| i << room.to_xml.target! }
            }
          end
          
          x.Opt @opt if @opt
          x.DateFrom @date_from if @date_from
          x.SCUqty @scu_qty if @scu_qty
        }
      }
      x
    end
  end
end
