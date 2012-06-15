module Saasu
  
  class InvoiceResponse < Base

    root "invoiceResponse"

    elements "invoice" => :Invoice

  end
  
end

