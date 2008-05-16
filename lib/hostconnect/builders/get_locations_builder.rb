module HostConnect
  # The GetLocation request returns a list of all location codes and names used
  # in the system. Note that each Opt option identifier contains a location code.
  class GetLocationsBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password ].freeze
      super(options)
    end
    
    def to_xml
      x = bare
      x.Request {
        x.GetLocationsRequest { x.AgentID @agent_id; x.Password @password }
      }
      x
    end
  end
end
