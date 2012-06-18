require 'spec_helper'

describe Saasu::InvoiceResponse do

  before(:all) do
    file = open(File.join(File.dirname(__FILE__), "mocks", "invoice_response.xml"))
    doc = Nokogiri::XML(file) do |config|
      config.options = Nokogiri::XML::ParseOptions::NOBLANKS
    end
    @invoiceResponse = Saasu::InvoiceResponse.new(doc.root)
  end

  subject { @invoiceResponse }

  it { should respond_to :invoice }

  describe :invoice do 

  subject { @invoiceResponse.invoice }

  it { should respond_to :uid }
  it { should respond_to :last_updated_uid }
  it { should respond_to :utc_first_created }
  it { should respond_to :utc_last_modified }
  it { should respond_to :transaction_type }
  it { should respond_to :date } 
  it { should respond_to :contact_uid } 
  it { should respond_to :ccy } 
  it { should respond_to :auto_populate_fx_rate }
  it { should respond_to :fc_to_bc_fx_rate } 
  it { should respond_to :requires_follow_up }

  end

end

