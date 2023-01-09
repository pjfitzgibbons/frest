require "./event"

include Event

class RecordUpserteed < EventBase
  getter :uuid, :data, :timestamp

  def initialize(@uuid : String,
                 @data : DataType,
                 @timestamp : Float64)
    raise(UUIDBlankException.new) if @uuid.blank?
    raise(TimestampBlankException.new) if @timestamp == 0.0
    raise(TimestampInvalidException.new) if @timestamp < 0.0
  end
end
