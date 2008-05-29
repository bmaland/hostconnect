module HostConnect
  class SupplierInfoBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password, :supplier_code, :supplier_id ].freeze
      super(options)
    end
    
    def to_xml
      x = bare
      x.Request {
        x.SupplierInfoRequest {
          x.AgentID @agent_id
          x.Password @password
          
          if @supplier_code
            @supplier_code.each { |s| x.SupplierCode s }
          end
          
          if @supplier_id
            @opt.each { |s| s.SupplierId s }
          end
        }
      }
      x
    end
  end
end
