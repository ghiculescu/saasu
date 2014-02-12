module Saasu
  class EmailMessage < Base

    elements "to" => :string,
              "from" => :string,
              "body" => :string,
              "subject" => :string
  end
end


