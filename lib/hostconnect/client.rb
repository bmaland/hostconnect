module HostConnect
  # Has the responsibility for the http connections
  class Client
    class << self
      # Posts a new xml request to the server, returning the response body
      def post_xml_request(xml)
        begin
          HostConnect.logger.debug "Request sent to server:\n" << xml

          req = Net::HTTP::Post.new(HostConnect.config.path)
          req['Content-Type'] = 'text/xml'
          req['Content-Length'] = xml.size.to_s
          response = http_connection.request(req, xml)

          HostConnect.logger.debug "Response:\n" << response.body
        rescue Exception
          error_description = "Error occured while sending data to HostConnect"
          HostConnect.logger.fatal "Exception thrown: " + error_description
          raise Exception, error_description
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
