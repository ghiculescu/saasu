require 'spec_helper'

describe Saasu::InvoiceResponse do

  before(:all) do
    file = open(File.join(File.dirname(__FILE__), "mocks", "invoice_response.xml"))
    @invoiceResponse = Saasu::InvoiceResponse.new(Nokogiri::XML(file))
  end

  subject { @invoiceResponse }

  it { should respond_to :invoice }

  describe :invoice do 

  subject { @invoiceResponse.invoice }

  it { should respond_to :uid }
  it { should respond_to :last_updated_uid }

  end

end

