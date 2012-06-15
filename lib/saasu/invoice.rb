module Saasu
  
  class Invoice < Transaction

    elements "transactionType" => :string,
            "contactUid" => :string,
            "shipToContactUid" => :integer,
            "externalNotes" => :string,
            "dueOrExpiryDate" => :date,
            "layout" => :string,
            "status" => :string,
            "invoiceNumber" => :string,
            "purchaseOrderNumber" => :string,
            "invoiceItems" => :array,
            "quickPayment" => :array,
            "isSent" => :boolean
  end
  
end
