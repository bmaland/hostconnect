module HostConnect
  class GetServices < AbstractResponse
    include Enumerable
    
    def size
      @size ||= @data.search("/Reply/GetServicesReply/TPLServices/TPLService").size
    end
    
    private
    def populate
      @elements = []
      
      @data.search("/Reply/GetServicesReply/TPLServices/TPLService").each do |location|
        s = Struct.new(:code, :name).new
        s.code = (location/"Code").innerHTML
        s.name = (location/"Name").innerHTML
        @elements << s
      end
    end
  end
end
