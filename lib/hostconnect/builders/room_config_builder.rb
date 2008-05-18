module HostConnect
  class RoomConfigBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :adults, :room_type, :pax_list ].freeze
      super(options)
    end
    
    def to_xml
      x = Builder::XmlMarkup.new(:indent => 2, :margin => 3)
      x.RoomConfig {
        (@valid_options - [ :pax_list ]).each do |opt|
          eval "x.#{opt.camelize} #{opt}"
        end
        
        if @pax_list
          # Stack the PaxDetails builder objects onto the request
          x.PaxList { |i|
            @pax_list.each { |pax| i << pax.to_xml.target! }
          }
        end
      }
      x
    end
  end
end
