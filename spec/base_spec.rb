require 'spec_helper'

describe "Saasu::Base" do

  it "should set the default option for collection_name" do
    #Saasu::Invoice.defaults[:collection_name].should eql("invoiceListItem")
  end
  
  it "should set the default option for resource_name" do
    #Saasu::Invoice.defaults[:resource_name].should eql("invoice")
  end
  
  describe "fields" do
    
    before do
      #file = open(File.join(File.dirname(__FILE__), "mocks", "invoice_item.xml"))
      #xml = Nokogiri::XML(file).css("invoiceListItem")
      #@invoiceListItem = Saasu::InvoiceListItem.new(xml)
    end
    
    it "should define accessors for all fields listed" do
      #@invoiceListItem.methods.should include(:invoice_uid=)
      #@invoiceListItem.methods.should include(:invoice_uid)
    end
    
    it "should cast any field listed as a decimal to a float" do
      #@invoiceListItem.amount_owed.should be_an_instance_of(Float)
    end
    
    it "should cast any field listed as a date to a date" do
      #@invoiceListItem.invoice_date.should be_an_instance_of(Date)
    end
    
    it "should cast any field listed as a integer to a integer" do
      #@invoiceListItem.invoice_uid.should be_an_instance_of(Fixnum)
    end
    
    describe "boolean fields" do
      
      it "should cast any field listed as a boolean, with a value of true as true" do
        #@invoiceListItem.is_sent.should eql(true)
      end
    
      it "should cast any field listed as a boolean, with a value of false as false" do
        #@invoiceListItem.requires_follow_up.should eql(false)
      end
      
    end
    
    it "should cast any field listed as a array to a array" do
      #@invoiceListItem.tags.should be_an_instance_of(Array)
    end
      
  end
  
end
