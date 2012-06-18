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

  describe Saasu::Invoice do 

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
  it { should respond_to :layout }
  it { should respond_to :status }
  it { should respond_to :invoice_number }
  it { should respond_to :invoice_items }

  end

  describe :invoice_items do 

  subject { @invoiceResponse.invoice.invoice_items.size } 

  it { should eq(1) }

  end 

  describe Saasu::ServiceInvoiceItem do 

  subject { @invoiceResponse.invoice.invoice_items.first }

  it { should respond_to :description }
  it { should respond_to :account_uid }
  it { should respond_to :total_amount_incl_tax }

  end


end

