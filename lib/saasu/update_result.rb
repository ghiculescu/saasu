module Saasu
  class UpdateResult < TaskResult
      attributes "updatedEntityUid" => :integer,
                 "lastUpdatedUid" => :string,
                 "utcLastModified" => :date
  end
end



