module HostConnect
  # The AgentInfo request returns information about the specified agent (and as with other
  # requests that require AgentID and Password an error is reported if the
  # AgentID / Password combination is invalid).
  class AgentInfoBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password ].freeze
      super(options)
    end
    
    def to_xml
      x = bare
      x.Request {
        x.AgentInfoRequest { x.AgentID @agent_id; x.Password @password }
      }
      x
    end
  end
end
