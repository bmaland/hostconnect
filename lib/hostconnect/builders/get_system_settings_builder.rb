module HostConnect
  # The GetSystemSettings request returns information about the overall system
  # settings.
  class GetSystemSettingsBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password ].freeze
      super(options)
    end
    
    def to_xml
      x = bare
      x.Request {
        x.GetSystemSettingsRequest { x.AgentID @agent_id; x.Password @password }
      }
      x
    end
  end
end
