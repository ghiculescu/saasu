module Saasu
  
  class InventoryItem < Entity 

    elements  "code" => :string,
              "description" => :string,
              "isActive" => :boolean,
              "notes" => :string,
              "isInventoried" => :boolean,
              "assetAccountUid" => :integer,
              "stockOnHand" => :decimal,
              "currentValue" => :decimal,
              "isBought" => :boolean,
              "purchaseExpenseAccountUid" => :integer,
              "purchaseTaxCode" => :string,
              "minimumStockLevel" => :integer,
              "primarySupplierContantUid" => :integer,
              "primarySupplierItemCode" => :string,
              "defaultReOrderQuantity" => :decimal,
              "isSold" => :boolean,
              "saleIncomeAccountUid" => :integer,
              "saleTaxCode" => :string,
              "saleCoSAccountUid" => :integer,
              "sellingPrice" => :decimal,
              "isSellingPriceIncTax" => :boolean,
              "isVirtual" => :boolean,
              "vType" => :string,
              "isVisible" => :string,
              "isVoucher" => :string,
              "validFrom" => :date,
              "validTo" => :date

  end
  
end

