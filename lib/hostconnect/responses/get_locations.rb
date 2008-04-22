module HostConnect
  class GetLocations < AbstractResponse
    include Enumerable
    
    def size
      @data.elements.to_a("/Reply/GetLocationsReply/Locations/Location").size
    end
    
    private
    def populate
      @elements = []
      
      @data.elements.to_a("/Reply/GetLocationsReply/Locations/Location").each do |location|
        s = OpenStruct.new
        location.elements.each do |field|
          next if field.text.nil? or field.text.blank?
          eval "s.#{field.name.underscore} = \"#{field.text}\""
        end
        @elements << s
      end
    end
  end
end
