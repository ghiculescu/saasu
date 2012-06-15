module Saasu
  class Transaction < Entity
    elements  "date" => :date,
              "tags" => :string,
              "summary" => :string,
              "notes" => :string,
              "requiresFollowUp" => :boolean,
              "ccy" => :string,
              "autoPopulateFxRate" => :boolean,
              "fcToBcFxRate" => :decimal
  end
end
 
