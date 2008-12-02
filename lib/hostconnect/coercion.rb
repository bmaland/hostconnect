module HostConnect
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
  # It must be possible to convert this data from/to native Ruby objects
  class Coercion
    # Convert HostConnect formatted data to Ruby objects
    def self.from_hc(data)
      case data
      when /^[0-9]+\d*$/           then data.to_i
      when /^(\d+\s){2,}[0-9 ]*$/  then data.split.collect { |i| i.to_i }
      when /^\s*$/                 then nil
      when /\d{4}-\d\d-\d\d/       then Date.parse(data)
      when "Y"                     then true
      when "N"                     then false
      else                         data.strip
      end
    end

    # Convert Ruby objects to HostConnect formatted data
    def self.to_hc(data)
      case data
      when Integer                 then data.to_s
      when Date                    then data.to_s
      when nil                     then ""
      when true                    then "Y"
      when false                   then "N"
      else                         data.strip
      end
    end

    # Time strings are i.e "2310"
    def self.time(string)
      Time.parse(string[0,2] << ":" << string[2,4])
    end

    def self.price(string)
     (string.to_f / 100).round
    end
  end
end
