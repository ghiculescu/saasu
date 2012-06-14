require 'spec_helper'

describe "Saasu::Invoice" do

  it "should be able to load an invoice from xml" do

    file = open(File.join(File.dirname(__FILE__), 
                "mocks", 
                "invoice.xml"))

    xml = Nokogiri::XML(file).css("invoiceResponse")

    puts xml

    @invoice = Saasu::Invoice.new(xml)
 
  end

end

