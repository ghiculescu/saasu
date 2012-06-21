module Saasu
  class Contact < Entity

    elements  "salutation" => :string,
              "givenName" => :string,
              "middleInitials" => :string,
              "familyName" => :string,
              "dateOfBirth" => :date,
              "organisation" => :string,
              "organisationUid" => :string,
              "organisationName" => :string,
              "organisationAbn" => :string,
              "companyEmail" => :string,
              "organisationWebsite" => :string,
              "organisationPosition" => :string,
              "contactID" => :string,
              "abn" => :string,
              "websiteUrl" => :string,
              "email" => :string,           
              "email_address" => :string,     # really! it's not consistant
              "mainPhone" => :string,
              "homePhone" => :string,
              "fax" => :string,
              "mobilePhone" => :string,
              "otherPhone" => :string,
              "statusUid" => :integer,
              "industryUid" => :integer,
              "postalAddress" => :Address,
              "otherAddress" => :Address,
              "isActive" => :boolean,
              "acceptDirectDeposit" => :boolean,
              "directDepositAccountName" => :string,
              "acceptCheque" => :boolean,
              "chequePayableTo" => :string,
              "tags" => :string,
              "customField1" => :string,
              "customField2" => :string,
              "twitterID" => :string,
              "skypeID" => :string,
              "linkedInPublicProfile" => :string,
              "autoSendStatement" => :boolean,
              "isPartner" => :boolean,
              "isCustomer" => :boolean,
              "isSupplier" => :boolean,
              "saleTradingTermsPaymentDueInInterval" => :integer,
              "saleTradingTermsPaymentDueInIntervalType" => :integer,
              "purchaseTradingTermsPaymentDueInInterval" => :integer,
              "purchaseTradingTermsPaymentDueInIntervalType" => :integer,
              "defaultSaleDiscount" => :decimal,
              "defaultPurchaseDiscount" => :decimal

  end
end
 
