module Saasu
  
  class ServiceInvoiceItem < Base

    elements  "description" => :string,
              "accountUid" => :integer,
              "taxCode" => :string,
              "totalAmountInclTax" => :decimal
  end
  
end

