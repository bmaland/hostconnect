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
    # Parses XML into a XmlSimple object. The XML should be the response from a request.
    def parse(xml)
      @data = XmlSimple.xml_in(xml)
      # Raise an error if the server returned an error reply.
      raise "Error" if @data.blank?
      raise ArgumentError, @data["ErrorReply"][0]["Error"][0] if @data["ErrorReply"]
    end
    
    private
    def initialize(xml)
      parse xml
      (instance_variable_defined?(:@attributes)) ? set_attrs : populate
    end
    
    # Sets all instance variables. This only works for the simple requests.
    # For convenience, an "attribute?" method is set for booleans.
    def set_attrs
      @attributes.each do |i|
        value = Coercion.coerce(@data[Inflector.demodulize(self.class) << "Reply"][0][i.camelize].to_s)
        if value.kind_of?(FalseClass) or value.kind_of?(TrueClass)
          eval "def #{i}?; #{i}; end"
        end
        instance_variable_set("@#{i}", value)
        self.class.class_eval "attr_reader :#{i}"
      end
    end
  end
end
