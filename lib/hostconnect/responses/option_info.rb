module HostConnect
  class OptionInfo < AbstractResponse
    include Enumerable
    
    def size
      @data["OptionInfoReply"][0]["Option"].size
    end
    
    private
    # Populates the +elements+ array with content from the XmlSimple object.
    # Hopefully I'll figure out how to make this cleaner . .
    def populate
      @elements = []
      @data["OptionInfoReply"][0]["Option"].each do |option|
        general = {}
        option["OptGeneral"][0].each { |k,v| general[k.underscore.to_sym] = Coercion.coerce(v) }
        general[:opt_extras] = nil
        general[:extra] = {}
        option["OptGeneral"][0]["OptExtras"][0]["OptExtra"][0].each do |k,v|
          general[:extra][k.underscore.to_sym] = Coercion.coerce(v)
        end
        
        rates = {}
        rates[:currency] = option["OptRates"][0]["Currency"]
        rates[:rate] = option["OptRates"][0]["OptRate"][0]
        rates[:rate][:room_rates] = option["OptRates"][0]["OptRate"][0]["RoomRates"][0]
        # ExtrasRates are optional
        if option["OptRates"][0]["OptRate"][0]["ExtrasRates"]
          rates[:rate][:extras_rate] = option["OptRates"][0]["OptRate"][0]["ExtrasRates"][0]["ExtrasRate"]
        end
        
        detailed_avails = []
        option["OptDetailedAvails"][0]["OptDetailedAvail"].each do |o|
          detailed_avails << { :unit_type => o["UnitType"], :opt_avail => o["OptAvail"] }
        end
        
        s = OpenStruct.new
        s.opt = option["Opt"][0]
        s.general = general
        s.rates = rates
        s.detailed_avails = detailed_avails
        if option["EnquiryNotes"]
          s.enquiry_notes = option["EnquiryNotes"][0]
        end
        
        @elements << s
      end
    end
  end
end
