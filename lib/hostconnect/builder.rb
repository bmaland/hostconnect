module HostConnect
  # Abstract class which all the different builder-classes inherit from. The builders are
  # used to produce valid XML requests, which are to be sent to the HostConnect server.
  class AbstractBuilder
    # String representation of self
    def to_s
      to_xml.target!
    end

    # Send xml to server. Returns a new object.
    def submit
      obj = ActiveSupport::Inflector.constantize(self.class.to_s.gsub(/Builder/, ''))
      obj.new(Client.post_xml_request(to_s))
    end

    protected
    # Returns a bare xml-builder object, containing just dtd, xml version and encoding
    def bare
      x = Builder::XmlMarkup.new(:indent => 2)
      x.instruct!
      x.declare! :DOCTYPE, :Request, :SYSTEM, HostConnect.config.dtd
      x
    end

    private
    def initialize(options = {})
      @options = options
      check_for_valid_options
      set_attrs
    end

    def check_for_valid_options
      @options.each_key do |k|
        raise("No such option: #{k}") unless @valid_options.include?(k)
      end
    end

    def set_attrs
      @options.each do |k,v|
        instance_variable_set("@#{k}", v)
      end

      # It should be possible to set all options after the objects creation,
      # from it's accessors
      unless @valid_options.blank?
        @valid_options.each { |k| self.class.class_eval "attr_accessor :#{k}" }
      end
    end
  end
end
