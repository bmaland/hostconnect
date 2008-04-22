module HostConnect
  class RoomConfigBuilder < AbstractBuilder
    def initialize(options = nil)
      @valid_options = [ :adults, :room_type, :pax_list ].freeze
      super(options)
    end
    
    def to_xml
      x = Builder::XmlMarkup.new(:indent => 2)
      x.RoomConfig {
        (@valid_options - [ :pax_list ]).each do |opt|
          eval "x.#{opt.camelize} #{opt}"
        end
        
        if @pax_list
          # Stack the PaxDetails builder objects
          x.PaxList { |i|
            if @pax_list.kind_of?(Array)
              @pax_list.each { |pax| i << pax.to_xml.target! }
            else
              i << @pax_list.to_xml.target!
            end
          }
        end
      }
      x
    end
  end
end
