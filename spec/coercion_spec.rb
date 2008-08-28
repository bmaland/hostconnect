require File.dirname(__FILE__) + "/spec_helper"

describe HostConnect::Coercion do
  it "should parse times" do
    time = Coercion.time("2310")
    time.should be_an_instance_of(Time)

    lambda { Coercion.time("2410") }.should raise_error(ArgumentError)
  end

  it "should divide prices by 100" do
    p = Coercion.price("10000")
    p.should == 100
  end

  it "should parse times" do
    time = Coercion.time("2310")
    time.should be_an_instance_of(Time)

    lambda { Coercion.time("2410") }.should raise_error(ArgumentError)
  end

  describe "Conversion of parameters from strings to Ruby objects" do
    it "should return a date from a datestring" do
      date = Coercion.from_hc("1985-10-24")
      date.should be_an_instance_of(Date)
      date.strftime("%m").should == "10"
    end

    it "should convert strings consisting of only numbers to integers" do
      val = "12345"
      res = Coercion.from_hc(val)
      res.should == 12345

      val = "12 34"
      res = Coercion.from_hc(val)
      res.should_not be_an_instance_of(Fixnum)
    end

    it "should return booleans for Y/N" do
      Coercion.from_hc("Y").should be_true
      Coercion.from_hc("N").should be_false
    end

    it "should return nil for strings consisting of only whitespace" do
      Coercion.from_hc("").should be_nil
      Coercion.from_hc("   ").should be_nil
    end

    it "should parse lists of integers" do
      l1 = Coercion.from_hc("11 22 3 4")
      l1.should be_an_instance_of(Array)
      l1.size.should == 4
      l1.first.should be_an_instance_of(Fixnum)
      l1.last.should be_an_instance_of(Fixnum)

      Coercion.from_hc("1 2 3 f 4").should be_an_instance_of(String)
    end
  end

  describe "Conversion of parameters from Ruby objects to HC formatted strings" do
    it "should turn dates into strings" do
      date = Coercion.to_hc("1985-10-24")
      date.should == "1985-10-24"

      date = "1985-10-24".to_date
      Coercion.to_hc(date).should == "1985-10-24"
    end

    it "should convert integers to strings" do
      val = 12345
      Coercion.to_hc(val).should == "12345"
    end

    it "should return Y/N for booleans" do
      Coercion.to_hc(true).should == "Y"
      Coercion.to_hc(false).should == "N"
    end

    it "should handle nil values and empty strings" do
      Coercion.to_hc(nil).should == ""
      Coercion.to_hc("   ").should == ""
    end
  end
end
