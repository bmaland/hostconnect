require File.dirname(__FILE__) + "/spec_helper"

describe HostConnect::Translation do
  it "should know about room types" do
    Translation.translate("Single").should == "SG"
    Translation.translate("Twin").should == "TW"
    Translation.translate("Double").should == "DB"
    Translation.translate("Triple").should == "TR"
    Translation.translate("Quad").should == "QD"
    Translation.translate("Twinn").should == nil

    Translation.translate("SG").should == "Single"
    Translation.translate("TW").should == "Twin"
    Translation.translate("DB").should == "Double"
    Translation.translate("TR").should == "Triple"
    Translation.translate("QD").should == "Quad"
  end
end
