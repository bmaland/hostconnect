module HostConnect
  class GetBookingPaymentSummary < AbstractResponse
    private
    def populate
      @data.search("/Reply/GetBookingPaymentSummaryReply") do |n|
        n.containers.each do |e|
          var = e.name.underscore

          if var == "currency"
            value = Hpricot.uxs(e.innerHTML)
          else
            value = Coercion.price(Hpricot.uxs(e.innerHTML))
          end

          instance_variable_set("@#{var}", value)
          self.class.class_eval "attr_reader :#{var}"
        end
      end
    end
  end
end
