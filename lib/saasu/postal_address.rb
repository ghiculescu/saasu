module Saasu
  class PostalAddress < Base
    root "postalAddress"
    elements  "street" => :string,
              "city" => :string,
              "state" => :string,
              "postCode" => :string,
              "country" => :string
  end
end
 

