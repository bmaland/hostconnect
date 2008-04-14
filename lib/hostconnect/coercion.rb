module HostConnect
  class Coercion
    # Coercion
    #
    # Possible Types:
    # * String
    # * Strings with multiple lines (don't know yet if these must be handled specifically)
    # * Boolean (Y/N)
    # * Date (yyyy-mm-dd)
    # * Time (hhmm)
    # * Integer
    # * Integer list (In an integer list, a single space is used to separate integer values.)
    # * Price (Prices returned are Tourplan prices multiplied by 100, + currency stuff..)
    #
    # These must be converted to native Ruby types.
    def self.coerce(string)
      result   = case string
                 when /^[0-9]+\d*$/           then string.to_i
                 when /\d{4}-\d\d-\d\d/       then Date.parse(string)
                 when /^(\d+\s){2,}[0-9 ]*$/  then string.split.collect { |i| i.to_i }
                 when /^\s*$/                 then nil
                 when "Y"                     then true
                 when "N"                     then false
                 else                         string
                 end
      result
    end
    
    # Creates Time-objects from strings formed as "hhmm"
    def self.time(string)
      Time.parse(string[0,2] << ":" << string[2,4])
    end
  end
end
