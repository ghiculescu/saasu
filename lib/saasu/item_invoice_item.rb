module Saasu
  
  class ItemInvoiceItem < Base

    elements  "quantity" => :decimal,
              "inventoryItemUid" => :integer,
              "description" => :string,
              "taxCode" => :string,
              "unitPriceInclTax" => :decimal,
              "percentageDiscount" => :decimal
  end
  
end


