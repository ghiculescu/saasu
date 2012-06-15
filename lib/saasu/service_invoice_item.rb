module Saasu
  
  class ServiceInvoiceItem < Base

    elements  "description" => :string,
              "accountUid" => :integer,
              "totalAmountInclTax" => :decimal
  end
  
end

