module HostConnect
  class NewBookingInfoBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :name, :qb, :branch, :department ].freeze
      super(options)
    end
    
    def to_xml
      x = Builder::XmlMarkup.new(:indent => 2, :margin => 2)
      x.NewBookingInfo {
        x.Name @name
        x.QB @qb
      }
      x
    end
  end
end
