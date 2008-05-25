module HostConnect
  class ListBookings < AbstractResponse
    include Enumerable
    
    def size
      @size ||= @data.search("/Reply/ListBookingsReply/*").size
    end
    
    private
    def populate
      @elements = []
    end
  end
end
