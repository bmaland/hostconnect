require File.dirname(__FILE__) + "/spec_helper"

describe HostConnect::Coercion do
  it "should return a date from a datestring" do
    date = Coercion.coerce("1985-10-24")
    date.should be_an_instance_of(Date)
    date.strftime("%m").should == "10"
  end
  
  it "should parse times" do
    time = Coercion.time("2310")
    time.should be_an_instance_of(Time)
    
    lambda { Coercion.time("2410") }.should raise_error(ArgumentError)
  end
  
  it "should convert strings consisting of only numbers to integers" do
    val = "12345"
    res = Coercion.coerce(val)
    res.should == 12345
    
    val = "12 34"
    res = Coercion.coerce(val)
    res.should_not be_an_instance_of(Fixnum)
  end
  
  it "should return booleans for Y/N" do
    Coercion.coerce("Y").should be_true
    Coercion.coerce("N").should be_false
  end
  
  it "should return nil for strings consisting of only whitespace" do
    Coercion.coerce("").should be_nil
    Coercion.coerce("   ").should be_nil
  end
  
  it "should parse lists of integers" do
    l1 = Coercion.coerce("11 22 3 4")
    l1.should be_an_instance_of(Array)
    l1.size.should == 4
    l1.first.should be_an_instance_of(Fixnum)
    l1.last.should be_an_instance_of(Fixnum)
    
    Coercion.coerce("1 2 3 f 4").should be_an_instance_of(String)
  end

  it "should divide prices by 100" do
    p = Coercion.price("10000")
    p.should == 100
  end
end
