module HostConnect
  class PaxDetailsBuilder < AbstractBuilder
    def initialize(options = nil)
      @valid_options = [ :title, :forename, :surname, :pax_type ].freeze
      super(options)
    end
    
    def to_xml
      x = Builder::XmlMarkup.new(:indent => 2)
      x.PaxDetails {
        @valid_options.each do |opt|
          eval "x.#{opt.camelize} #{opt}" if respond_to?(opt)
        end
      }
      x
    end
  end
end