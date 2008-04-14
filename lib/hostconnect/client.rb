module HostConnect
  # Has the responsibility for the http connections
  class Client
    @@config = HostConnect::Config.new
    
    class << self
      # Set configuration variables for the HTTP client.
      # Settings:
      #   * dtd
      #   * host
      #   * path
      #   * port
      def configure(&block)
        raise ArgumentError, "Block must be provided to configure" unless block_given?
        yield @@config
      end
      
      # Returns the config class-variable
      def config
        @@config
      end
      
      # Posts a new xml request to the server, returning the response body
      def post_xml_request(xml)
        xml = xml.to_s unless xml.kind_of? String
        begin
          req = Net::HTTP::Post.new(@@config.path)
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
        @@http ||= Net::HTTP.new(@@config.host, @@config.port)
      end
    end
  end
end
