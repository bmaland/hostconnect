module HostConnect
  class GetSystemSettings < AbstractResponse
    def initialize(xml)
      parse xml
    end
  end
end
