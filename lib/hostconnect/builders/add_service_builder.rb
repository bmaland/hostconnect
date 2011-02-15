module HostConnect
  # A booking is built up service by service. Each AddService request adds one
  # service to a (new or existing) booking. Note that for a service to be added
  # to an existing booking the agent adding the service must be the same as the
  # agent who made the original booking.
  class AddServiceBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password, :new_booking_info, :opt, :date_from,
                         :scu_qty, :room_configs, :email, :pu_time, :pu_remark,
                         :do_time, :do_remark, :remarks, :ud_text1, :ud_text2,
                         :ud_text3, :ud_text4, :ud_text5, :agent_ref,
                         :service_line_notes, :rate_id].freeze
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

          if @service_line_notes
            x.ServiceLineNotes { |i|
              @service_line_notes.each { |note| i << note.to_xml.target! }
            }
          end
          
          x.RateId @rate_id
          x.Opt @opt if @opt
          x.DateFrom @date_from if @date_from
          x.SCUqty @scu_qty if @scu_qty
          x.Email @email if @email
          x.AgentRef @agent_ref if @agent_ref
          x.puTime @pu_time if @pu_time
          x.puRemark @pu_remark if @pu_remark
          x.doTime @do_time if @do_time
          x.doRemark @do_remark if @do_remark
          x.Remarks @remarks if @remarks
          x.UDText1 @ud_text1 if @ud_text1
          x.UDText2 @ud_text2 if @ud_text2
          x.UDText3 @ud_text3 if @ud_text3
          x.UDText4 Coercion.to_hc(@ud_text4) unless @ud_text4.nil?
          x.UDText5 @ud_text5 if @ud_text5
        }
      }
      x
    end
  end
end