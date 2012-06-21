module Saasu
  class ErrorInfo < Base
      elements  "type" => :string,
                "message" => :string,
                "stackTrace" => :string
  end
end


