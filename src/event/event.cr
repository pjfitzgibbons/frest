module Event
  abstract class EventBase
  end

  alias ValueType = Bool |
               Int32 |
               Int64 |
               Float64 |
               String 

  alias DataType = Hash(String, ValueType)

  class UUIDBlankException < Exception
  end
  class KeyBlankException < Exception
  end
  class TimestampBlankException < Exception
  end
  class TimestampInvalidException < Exception
  end

end
