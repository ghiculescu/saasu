module Saasu
  class UpdateResult < TaskResult
      elements  "updateEntityUid" => :integer,
                "lastUpdateUid" => :string,
                "utcLastModified" => :date
  end
end



