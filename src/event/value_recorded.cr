require "./event"

include Event

class ValueRecorded < EventBase
  getter :uuid, :key, :value, :timestamp

  def initialize(@uuid : String,
                 @key : String,
                 @value : ValueType,
                 @timestamp : Float64)
    raise(UUIDBlankException.new) if @uuid.blank?
    raise(KeyBlankException.new) if @key.blank?
    raise(TimestampBlankException.new) if @timestamp == 0.0
    raise(TimestampInvalidException.new) if @timestamp < 0.0
  end
end
