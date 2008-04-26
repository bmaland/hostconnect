module HostConnect
  # Configuration Class
  class Config
    attr_reader :dtd, :host, :path, :port
    
    # Initialize config object with default values
    def initialize
      @dtd = "http://www.tourplan.com/support/Connector/hostConnect_2_05_300.dtd"
      @host, @path, @port = "127.0.0.1", "/", "80"
      
      # Override defaults if the config file exists
      if File.exists?("config/config.yml")
        c = File.open("config/config.yml") { |yf| YAML::load(yf) }["hostconnect"]
        @dtd, @host, @path, @port = c["dtd"], c["host"], c["path"], c["port"]
      end
    end
  end
end
