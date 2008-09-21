module HostConnect
  class RecordBookingPaymentBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :agent_id, :password, :booking_id, :currency,
                         :amount, :receipt_type ].freeze
      super(options)
    end

    def to_xml
      x = bare
      amount = (@amount.to_f * 100).to_i # Format amount for HostConnect
      x.Request {
        x.RecordBookingPaymentRequest {
          x.AgentID @agent_id
          x.Password @password
          x.BookingId @booking_id
          x.Currency @currency
          x.Amount amount
          x.ReceiptType @receipt_type
        }
      }
      x
    end
  end
end
