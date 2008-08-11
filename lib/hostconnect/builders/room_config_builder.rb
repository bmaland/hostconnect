module HostConnect
  class RoomConfigBuilder < AbstractBuilder
    # Room types: SG  (single), TW (twin), DB  (double), TR (triple), QD (quad)
    def initialize(options = {})
      @valid_options = [ :adults, :room_type, :pax_list ].freeze
      super(options)
    end

    def to_xml
      x = Builder::XmlMarkup.new(:indent => 2, :margin => 3)
      x.RoomConfig {
        x.Adults @adults if @adults
        x.RoomType Coercion.to_hc(@room_type) if @room_type

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
