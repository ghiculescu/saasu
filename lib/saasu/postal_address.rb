module Saasu
  class Address < Base
    root "address"
    elements  "street" => :string,
              "city" => :string,
              "state" => :string,
              "postCode" => :string,
              "country" => :string
  end
end
 

