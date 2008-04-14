module HostConnect
  # The Ping request is provided as a simple way of determining whether hostConnect is alive.
  # No arguments needed.
  class PingBuilder < AbstractBuilder
    def to_xml
      x = bare
      x.Request { x.PingRequest }
      x
    end
  end
end
