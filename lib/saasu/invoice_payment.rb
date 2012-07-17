module Saasu
  
  class InvoicePayment < Entity

    elements  "transactionType" => :string,
              "contactUid" => :integer,
              "date" => :date,  
              "reference" => :string,
              "summary" => :string,
              "ccy" => :string,
              "autoPopulateFxRate" => :boolean,
              "fcToBcFxRate" => :decimal,
              "notes" => :string,
              "requiresFollowUp" => :boolean,
              "paymentAccountUid" => :integer,
              "dateCleared" => :date,
              "fee" => :decimal,
              "invoicePaymentItems" => :array
  end
  
end

