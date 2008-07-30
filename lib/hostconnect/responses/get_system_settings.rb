module HostConnect
  class GetSystemSettings < AbstractResponse
    private
    def populate
      set_attrs

      @countries = []
      @data.search("/Reply/GetSystemSettingsReply/Countries/Country").each do |country|
        c = Struct.new(:country_name, :destination_names).new
        c.country_name = (country/"CountryName").innerHTML

        c.destination_names = []

        (country/"DestinationNames/DestinationName").each do |destination_name|
          d = Struct.new(:destination_name).new
          d.destination_name = destination_name.innerHTML
          c.destination_names << d
        end

        @countries << c
      end
    end
  end
end
