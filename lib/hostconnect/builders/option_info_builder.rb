module HostConnect
  class OptionInfoBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password, :opt, :option_number, :info,
        :date_from, :date_to, :scu_qty, :a_cache, :rate_convert, :room_configs,
        :minimum_availability, :sort_field, :ascending, :index_first_option,
        :maximum_options, :note_category, :location_code, :locality_description,
        :class_description, :description, :supplier_name, :rate_per_scu ].freeze
      super(options)
    end
    
    def to_xml
      x = bare
      x.Request {
        x.OptionInfoRequest {
          # TODO: probably need to validate sanity of Info / RateConvert here,
          # and raise exceptions if they are invalid
          
          # Has to substract from @valid_options instead of @options, because
          # we have to guarantee the order of elements.
          (@valid_options - [ :room_configs, :opt, :option_number ]).each do |opt|
            # Requestify turns Id into ID
            
            # TODO: I guess this could be done with less eval usage.
            # Basically, we build xml only for those options that are non-blank
            val = eval "#{opt}"
            eval "x.#{opt.camelize.requestify} #{opt}" unless val.blank?
          end
          
          if @opt
            @opt.each { |o| x.Opt o }
          end
          
          if @option_number
            @option_number.each { |o| x.OptionNumber o }
          end
          
          if @room_configs
            # Stack the room configs onto the request
            x.RoomConfigs { |i|
              @room_configs.each { |room| i << room.to_xml.target! }
            }
          end
        }
      }
      x
    end
  end
end
