module HostConnect
  # Has the responsibility for the http connections
  class Client    
    class << self
      # Posts a new xml request to the server, returning the response body
      def post_xml_request(xml)
        xml = xml.to_s unless xml.kind_of? String
        begin
          req = Net::HTTP::Post.new(HostConnect.config.path)
          req['Content-Type'] = 'text/xml'
          req['Content-Length'] = xml.size.to_s
          response = http_connection.request(req, xml)
          
          HostConnect.logger.debug "Request sent to server:\n" << xml
          HostConnect.logger.debug "Response:\n" << response.body
        ensure
          http_connection.finish if http_connection.started?
        end
        response.body
      end
      
      # Returns the http connection
      def http_connection
        @@http ||= Net::HTTP.new(HostConnect.config.host, HostConnect.config.port)
      end
    end
  end
end
