module HostConnect
  class Ping < AbstractResponse
    def initialize(xml)
      @attributes = [ :version, :backend ].freeze
      super(xml)
    end
  end
end
