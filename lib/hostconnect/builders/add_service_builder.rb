module HostConnect
  # A booking is built up service by service. Each AddService request adds one
  # service to a (new or existing) booking. Note that for a service to be added
  # to an existing booking the agent adding the service must be the same as the
  # agent who made the original booking.
  #
  # TODO problems with remarks
  class AddServiceBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password, :new_booking_info, :opt, :date_from,
                         :scu_qty, :room_configs, :email, :pu_time, :pu_remark,
                         :do_time, :do_remark, :remarks, :user_text1, :user_text2,
                         :user_text3, :user_text4, :user_text5 ].freeze
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
          x.Email @email if @email
          x.puTime @pu_time if @pu_time
          x.puRemark @pu_remark if @pu_remark
          x.doTime @do_time if @do_time
          x.doRemark @do_remark if @do_remark
          x.Remarks @remarks if @remarks
          x.UserText1 @user_text1 if @user_text1
          x.UserText2 @user_text2 if @user_text2
          x.UserText3 @user_text3 if @user_text3
          x.UserText4((@user_text4) ? "T" : "F")
          x.UserText5 @user_text5 if @user_text5
        }
      }
      x
    end
  end
end
