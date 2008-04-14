module HostConnect
  class AgentInfo < AbstractResponse
    def initialize(xml)
      @attributes = [ :currency, :email, :name, :price_codes, :is_sub_login,
                      :has_booking_rights ].freeze
      super(xml)
    end
  end
end
