module Saasu
  class Entity < Base

    attributes  "uid" => :integer,
                "lastUpdatedUid" => :string

    elements  "utcFirstCreated" => :date,
              "utcLastModified" => :date

  end
end
 
