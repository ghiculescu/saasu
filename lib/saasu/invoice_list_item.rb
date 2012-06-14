module Saasu
  
  class InvoiceListItem < Base
    
    fields "invoiceUid"                => :integer,
           "lastUpdatedUid"            => :string,
           "ccy"                       => :string,
           "autoPopulateFXRate"        => :boolean,
           "fcToBcFxRate"              => :decimal,
           "transactionType"           => :string,
           "invoiceDate"               => :date,
           "utcFirstCreated"           => :date,
           "utcLastModified"           => :date,
           "summary"                   => :string,
           "invoiceNumber"             => :string,
           "purchaseOrderNumber"       => :string,
           "dueDate"                   => :date,
           "totalAmountInclTax"        => :decimal,
           "paymentCount"              => :integer,
           "totalAmountPaid"           => :interger,
           "amountOwed"                => :decimal,
           "paidStatus"                => :string,
           "requiresFollowUp"          => :boolean,
           "isSent"                    => :boolean,
           "invoiceLayout"             => :string,
           "invoiceStatus"             => :string,
           "contactUid"                => :integer,
           "contactGivenName"          => :string,
           "contactFamilyName"         => :string,
           "contactOrganisationName"   => :string,
           "shipToContactUid"          => :string,
           "shipToContactFirstname"    => :string,
           "shipToContactLastName"     => :string,
           "shipToContactOrganisation" => :string,
           "tags"                      => :array
      
      defaults :query_options => { :transaction_type => "s" }
  end
  
end

