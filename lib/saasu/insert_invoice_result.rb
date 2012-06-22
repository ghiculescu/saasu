module Saasu
  class InsertInvoiceResult < InsertResult
      attributes "sentToContact" => :boolean,
                 "generatedInvoiceNumber" => :string,
                 "generatedPurchaseOrderNumber" => :string
  end
end





