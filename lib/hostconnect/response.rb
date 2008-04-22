module HostConnect
  # Abstract response class. Each subclass takes the XML responses and turns them into
  # a basic datastructure, with each element available as an attribute.
  class AbstractResponse
    # Yields each element
    def each
      elements.each { |e| yield e }
    end
    
    # Returns the first element
    def first
      elements.first
    end
    
    # Returns the last element
    def last
      elements.last
    end
    
    # Act like an array
    def [](num)
      elements[num]
    end
    
    # Exposes the element-array of responses which consists of multiple elements.
    # Raises an error if used on non-collection responses (Ping etc).
    def elements
      (@elements.blank?) ? raise(ArgumentError, "Not a collection") : @elements
    end
    
    protected
    # Parses XML into a XmlSimple object. The XML should be the response from a
    # request.
    def parse(xml)
      @data = REXML::Document.new xml
      
      # Raise an error if the server returned an error reply.
      raise "Error" if @data.blank?
      raise ArgumentError, REXML::XPath.first(@data, ("///Error")).text unless
        REXML::XPath.match(@data, "/Reply/ErrorReply").blank?
    end
    
    private
    def initialize(xml)
      parse xml
      (respond_to? "size") ? populate : set_attrs
    end
    
    # Sets all instance variables. This only works for the simple requests.
    # For convenience, an "attribute?" method is set for booleans.
    def set_attrs
      raise "Error" if @data.blank?
      class_name = Inflector.demodulize(self.class) << "Reply"
      @data.elements.each("Reply/" << class_name << "/*") do |e|
        var = e.name.underscore
        value = Coercion.coerce(e.text)
        if value.kind_of?(FalseClass) || value.kind_of?(TrueClass)
          eval "def #{var}?; #{var}; end"
        end
        instance_variable_set("@#{var}", value)
        self.class.class_eval "attr_reader :#{var}"
      end
    end
  end
end
