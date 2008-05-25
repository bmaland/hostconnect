module HostConnect
  # The GetServices request returns a list of all service codes and names used
  # in the system. Note that each Opt option identifier contains a service code.
  class GetServicesBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password ].freeze
      super(options)
    end
    
    def to_xml
      x = bare
      x.Request {
        x.GetServicesRequest { x.AgentID @agent_id; x.Password @password }
      }
      x
    end
  end
end
