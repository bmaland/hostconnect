module HostConnect
  class << self
    def setup(environment, config)
      config[:dtd] =
        'http://www.tourplan.com/support/Connector/hostConnect_' << config[:version] << '.dtd'
      Client.config = OpenStruct.new config
    end
  end
  
  # Has the responsibility for the http connections
  class Client
    @@config = nil
    
    class << self
      # Returns the config class-variable
      def config
        @@config
      end
      
      def config=(config)
        @@config = config
      end
      
      # Posts a new xml request to the server, returning the response body
      def post_xml_request(xml)
        xml = xml.to_s unless xml.kind_of? String
        begin
          req = Net::HTTP::Post.new(config.path)
          req['Content-Type'] = 'text/xml'
          req['Content-Length'] = xml.size.to_s
          response = http_connection.request(req, xml)
        ensure
          http_connection.finish if http_connection.started?
        end
        response.body
      end
      
      # Returns the http connection
      def http_connection
        @@http ||= Net::HTTP.new(config.host, config.port)
      end
    end
  end
end
