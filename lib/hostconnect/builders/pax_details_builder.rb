module HostConnect
  class PaxDetailsBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :title, :forename, :surname, :date_of_birth, :pax_type,
                         :pax_text1, :pax_text2, :pax_text3, :pax_text4,
                         :pax_text5 ].freeze
      super(options)
    end

    def to_xml
      x = Builder::XmlMarkup.new(:indent => 2, :margin => 5)
      x.PaxDetails {
        @valid_options.each do |opt|
          val = eval "#{opt}"
          eval "x.#{opt.camelize} #{opt}" unless val.blank?
        end
      }
      x
    end
  end
end
