module Saasu
  class TransactionCategory < Entity

    elements  "type" => :string,
              "name" => :string,
              "isActive" => :boolean,
              "ledgerCode" => :string,
              "defaultTaxCode" => :string

  end
end
 
