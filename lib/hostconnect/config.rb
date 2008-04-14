module HostConnect
  # Configuration Class
  class Config
    attr_accessor :dtd, :host, :path, :port
    
    # Initialize config object with default values
    def initialize
      @dtd = "http://www.tourplan.com/support/Connector/hostConnect_2_05_300.dtd"
      @host = "127.0.0.1"
      @path = "/echo"
      @port = 2000
    end
  end
end
