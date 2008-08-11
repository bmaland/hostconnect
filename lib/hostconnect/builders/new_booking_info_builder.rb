module HostConnect
  class NewBookingInfoBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :name, :qb, :branch, :department,
                         :sales_analysis1, :sales_analysis2, :sales_analysis3 ].freeze
      super(options)
    end

    def to_xml
      x = Builder::XmlMarkup.new(:indent => 2, :margin => 2)
      x.NewBookingInfo {
        x.Name @name
        x.QB @qb
        x.Branch @branch if @branch
        x.Department @department if @department
        x.SalesAnalysis1 @sales_analysis1 if @sales_analysis1
        x.SalesAnalysis2 @sales_analysis2 if @sales_analysis2
        x.SalesAnalysis3 @sales_analysis3 if @sales_analysis3
      }
      x
    end
  end
end
