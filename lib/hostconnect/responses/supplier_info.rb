module HostConnect
  class SupplierInfo < AbstractResponse
    include Enumerable
    
    def size
      @size ||= @data.search("/Reply/SupplierInfoReply/Suppliers/Supplier").size
    end
    
    private
    def populate
      @elements = []
      
      @data.search("/Reply/SupplierInfoReply/Suppliers/Supplier").each do |supplier|
        s = OpenStruct.new
        s.supplier_id = (supplier/"SupplierId").innerHTML
        s.supplier_code = (supplier/"SupplierCode").innerHTML
        s.name = (supplier/"Name").innerHTML
        s.address1 = (supplier/"Address1").innerHTML
        s.address2 = (supplier/"Address2").innerHTML
        s.address3 = (supplier/"Address3").innerHTML
        s.address4 = (supplier/"Address4").innerHTML
        s.address5 = (supplier/"Address5").innerHTML
        s.post_code = (supplier/"PostCode").innerHTML
        s.supplier_note = (supplier/"SupplierNotes"/"SupplierNote"/"NoteText").innerHTML
        
        @elements << s
      end
    end
  end
end
