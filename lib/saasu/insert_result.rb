module Saasu
  class InsertResult < Base
      attributes "insertedEntityUid" => :integer,
                 "lastUpdatedUid" => :string,
                 "utcLastModified" => :date
  end
end




