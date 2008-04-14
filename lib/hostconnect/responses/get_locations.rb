module HostConnect
  class GetLocations < AbstractResponse
    include Enumerable
    
    def size
      @data["GetLocationsReply"][0]["Locations"][0]["Location"].size
    end
    
    private
    def populate
      @elements = []
      @data["GetLocationsReply"][0]["Locations"][0]["Location"].each do |location|
        s = OpenStruct.new
        s.code = location["Code"][0]
        s.name = location["Name"][0]
        @elements << s
      end
    end
  end
end
