module HostConnect
  # Translate to/from HostConnect codes
  class Translation
    GRAMMAR = {
      "SG" => "Single",
      "TW" => "Twin",
      "DB" => "Double",
      "TR" => "Triple",
      "QD" => "Quad",
      "CF" => "Confirmed",
      "CX" => "Cancelled",
      "FQ" => "FIT Quote",
      "IN" => "Internet Booking",
      "RQ" => "Request"
    }

    def self.translate(string)
      (string =~ /^[A-Z]{2}$/) ? GRAMMAR[string] : GRAMMAR.invert[string]
    end
  end
end
