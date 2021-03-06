module HostConnect
  class GetLocations < AbstractResponse
    include Enumerable
    
    def size
      @size ||= @data.search("/Reply/GetLocationsReply/Locations/Location").size
    end
    
    private
    def populate
      @elements = []
      
      @data.search("/Reply/GetLocationsReply/Locations/Location").each do |location|
        s = Struct.new(:code, :name).new
        s.code = (location/"Code").innerHTML
        s.name = (location/"Name").innerHTML
        @elements << s
      end
    end
  end
end
