module Saasu
  
  class ItemInvoiceItem < Base

    elements  "quantity" => :decimal,
              "inventoryItemUid" => :integer,
              "description" => :string,
              "taxCode" => :string,
              "unitPriceInclTax" => :decimal,
              "totalAmountInclTax" => :decimal,
              "totalAmountExclTax" => :decimal,
              "totalTaxAmount" => :decimal,
              "percentageDiscount" => :decimal
  end
  
end


