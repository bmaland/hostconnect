module HostConnect
  class Ping < AbstractResponse
    def to_s
      backend << " " << version
    end
  end
end
