module HostConnect
  # The OptionInfo request returns information about one or more options. The request specifies a
  # combination of details to be returned, from the list: general information, stay pricing and 
  # availability, rate information, availability information, detailed availability information,
  # enquiry notes, detailed enquiry notes, amenities, FYIs, replicated locations encountered in
  # the search, replicated locations for suppliers, pickup points for suppliers.
  #
  # Each option has two unique identifiers: its option identifier and its option number.
  # The OptionInfo and AddService requests accept either for the purposes of identifying a
  # particular option, and the OptionInfo request returns both. Of the two, the option number
  # is less likely to change over time. The supplier code component of the option identifier will
  # very likely change if the supplier name changes, and supplier name changes are not uncommon.
  # Other components of the option identifier (such as location and service codes) are much less
  # likely to change over time, but such changes occur occasionally.
  #
  # Options are specified to the OptionInfo request as zero or more option identifiers and zero
  # or more option numbers, and zero or more (button name, destination name) pairs (at least one
  # of these must be specified).
  # 
  # == Input items
  # === Opt (String(17))
  # Tourplan option identifier (Location + Service + Supplier + Option code). Location must
  # be exactly three chracters, service two characters and supplier six characters. Trailing
  # spaces can be omitted from the option code.
  #
  # Zero or more option identifiers are to be specified.
  #
  # A pattern is an option identifer that contains one or more ? characters.
  #
  # === OptionNumber (Integer)
  # Tourplan option number. Zero or more option numbers are to be specified.
  #
  # === ButtonName + DestinationName (String)
  # Zero or more pairs of these fields can be specified. For each pair, the options associated
  # with the service button, destination name pair are inclided in the search.
  #
  # === Info (String)
  # Specifies the categories of option data to return. One letter is used to specify each
  # category of data are available, and any combination of the available letters can be
  # specified: G (general), A (availability), I (detailed availability), R (rates),
  # S (stay pricing and availability), D (rate date ranges), N (enquiry notes),
  # T (multiple enquiry notes), F (FYIs), M (amenities),
  # L (supplier replicated locations, LocationCodes only),
  # P (supplier replicated locations, LocationCodes with pickup points),
  # V (replicated locations encounted in search).
  # If the Info data item is empty, or is omitted, then only option identifiers and
  # ValidLocations are returned. Note that only one of the rate types (R, S, D) can be asked for.
  #
  # === DateFrom (Date)
  # If DateFrom is not specified then start date defaults to today (on the server).
  #
  # === DateTo (Date) / SCUqty (Integer)
  # DateTo and SCUqty are alternatives for specifying the duration of the period that stay, rate
  # and inventory information is required for. If SCUqty is specified it is the length of the
  # period (days/nights). If DateTo is specified then SCUqty is DateTo minus DateFrom plus 1.
  # If neither is specified then SCUqty defaults to 1.
  #
  # === ACache (Boolean)
  # If the data item value is true (or if the ACache data item is omitted) then availability
  # information returned (if any) is retrieved from the cache within hostConnect. If the value
  # is false then availability information is retrieved from Tourplan (this provides somewhat
  # more up to date information, but is considerably slower). Because of the performance
  # penalty, this data item should be set to N in situations where it is important to get up
  # to date availability information for a small groups of options (for example, as part of the
  # checking process in finalising a booking).
  #
  # === RateConvert (Boolean)
  # If the data item value is true then all rate information is converted to the currency
  # associated with the specified agent. If it is false, no rate conversions are performed,
  # and rates are returned in the currency in which they are stored. If RateConvert is not
  # specified then whether currency conversion occurs or not is determined by a system default.
  # Note: this data item has no effect if R or S is not specified in Info.
  #
  # === NoteCategory (String)
  # Optional.
  #
  # === LocationCode (String(3))
  # Specifies that only SupplierLocations matching this code should be returned (if a
  # LocationCode is supplied then Info is treated as containing P, but restricted to the
  # location specified).
  #
  # === LocalityDescription	(String)
  # If specified, only options in this locality are returned.
  # Optional.
  # 
  # === ClassDescription (String)
  # If specified, only options with this class are returned. Optional.
  # 
  # === Description	(String)
  # If specified, only options whose description contains the specified description are
  # returned. Optional.
  # 
  # === SupplierName (String)
  # If specified, only options whose supplier name contains the specified supplier name
  # are returned. Optional.
  # 
  # === RatePerScu (Boolean)
  # Only relevant for stay pricing. If true, then the stay price returned is a per scu
  # (e.g. per day or per night) rate. If false (the default) then the rate for the
  # entire stay is returned. Optional.
  class OptionInfoBuilder < AbstractBuilder
    def initialize(options = nil)
      @valid_options = [ :agent_id, :password, :opt, :option_number, :info,
        :date_from, :date_to, :scu_qty, :a_cache, :rate_convert, :room_config,
        :minimum_availability, :sort_field, :ascending, :index_first_option,
        :maximum_options, :note_category, :location_code, :locality_description,
        :class_description, :description, :supplier_name, :rate_per_scu ].freeze
      super(options)
    end
    
    def to_xml
      x = bare
      x.Request {
        x.OptionInfoRequest {
          # Has to substract from @valid_options instead of @options, because
          # we have to guarantee the order of elements.
          (@valid_options - [ :room_config, :opt, :rate_convert,
                              :option_number ]).each do |opt|
            # Requestify turns Id into ID
            eval "x.#{opt.camelize.requestify} #{opt}" if respond_to?(opt)
          end
          
          if @opt
            @opt.each { |o| x.Opt o }
          end
          
          if @option_number
            @option_number.each { |o| x.OptionNumber o }
          end
          
          # This data item has no effect if R or S  is not specified in Info.
          if @rate_convert && (info =~ /R/ and info =~ /S/)
            x.RateConvert @rate_convert
          end
          
          if @room_config
            # Stack the room configs onto the request
            x.RoomConfigs { |i|
              if @room_config.kind_of?(Array)
                @room_config.each { |room| i << room.to_xml.target! }
              else
                i << @room_config.to_xml.target!
              end
            }
          end
        }
      }
      x
    end
  end
end
