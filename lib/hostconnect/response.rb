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
    def parse(xml)
      @data = Hpricot.XML xml
      error_reply = @data.search("/Reply/ErrorReply/Error")
      unless error_reply.blank?
        error_msg = error_reply.innerHTML
        error_code = error_msg[0..3].to_i

        # See http://www.tourplan.com/support/Connector/ErrorMessages.html
        error_description = case error_code
                            when 1000 then "General error."
                            when 1001 then "Missing input."
                            when 1002 then "Illegal input."
                            when 1003 then "Data communications link within iCom failed."
                            when 1004 then "A timeout occurred while an iCom component was waiting for something to happen."
                            when 1005 then "A database access error occurred within an iCom component."
                            when 1006 then "An error occurred when an iCom component attempted a file access of some sort."
                            when 1007 then "Data servlet cache not loaded."
                            when 1008 then "An error was reported by the iCom booking engine."
                            when 1009 then "The booking engine is currently off-line."
                            when 1040 then "No merchant account."
                            when 1050 then "Booking not found."
                            when 1051 then "Agent not found (or wrong password given)."
                            when 1052 then "Option not found."
                            when 1053 then "Service line not found."
                            when 1054 then "Operation is illegal on a read-only booking."
                            when 1055 then "Operation is illegal for an agent over their credit limit."
                            when 1056 then "Operation is illegal for this service line."
                            when 1057 then "Permission denied for this operation."
                            when 1058 then "The object the request is trying to create already exists."
                            when 1059 then "Supplier not found."
                            when 1060 then "Database record not found."
                            when 1061 then "Supplier exists."
                            when 1062 then "Option exists."
                            when 1063 then "Agent exists, but has no default currency (iS iCom only)."
                            when 1064 then "Operation is illegal on a non-iCom booking."
                            when 1065 then "Login failed; two or more agents have this login."
                            when 2000 then "Credit card expired."
                            when 2001 then "Credit card number invalid (is non-numeric, or fails validation check)."
                            when 2002 then "Card wrong type (card type does not match the specified card type)."
                            when 2006 then "Operation requested is not valid for a confirmed booking."
                            when 2007 then "Operation requested is not valid for a quote."
                            when 2008 then "Error accessing external card payment system."
                            when 2009 then "Transaction refused by external card payment system."
                            when 2010 then "All services already cancelled."
                            when 2011 then "Attempt to add service violates a MinSCU requirement at the option rate level."
                            when 2050 then "Connector refused request. No valid hostConnect or webConnect entry was found that permitted the specfied request by the specified agent from the source IP address of the request."
                            when 5000 then "The specified BookingUpdateCount is no longer valid; request rejected."
                            when 5001 then "The specified ServiceLineUpdateCount is no longer valid; request rejected."
                            else           "Unknown error."
                            end

        HostConnect.logger.fatal "Exception thrown!"
        raise ArgumentError, error_msg << " (" << error_description << ")"
      end
    end

    private
    def initialize(xml)
      parse xml
      private_methods.include?("populate") ? populate : set_attrs
    end

    # Sets all instance variables. This only works for the simple requests.
    # For convenience, query methods gets defined for booleans.
    def set_attrs
      class_name = Inflector.demodulize(self.class) << "Reply"
      @data.search("/Reply/" << class_name) do |n|
        n.containers.each do |e|
          var = e.name.underscore

          # Special treatment for variables that end with "_price"
          if var =~ /_price$/
            value = Coercion.price(Hpricot.uxs(e.innerHTML))
          else
            value = Coercion.from_hc(Hpricot.uxs(e.innerHTML))
          end

          if value.kind_of?(FalseClass) || value.kind_of?(TrueClass)
            eval "def #{var}?; #{var}; end"
          end

          instance_variable_set("@#{var}", value)
          self.class.class_eval "attr_reader :#{var}"
        end
      end
    end
  end
end
