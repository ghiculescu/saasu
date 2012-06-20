module Saasu
  class ErrorInfo < Base
      root "error"
      
      elements  "type" => :string,
                "message" => :string,
                "stackTrace" => :string
  end
end


