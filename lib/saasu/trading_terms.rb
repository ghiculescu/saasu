module Saasu
  class TradingTerms < Base

    elements "type" => :integer,
              "interval" => :integer,
              "intervalType" => :integer,
              "typeEnum" => :string,
              "intervalTypeEnum" => :string
  end
end


