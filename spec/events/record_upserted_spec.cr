require "../spec_helper"
require "../../src/event"
require "../../src/event/record_upserted"

include Event

Spectator.describe RecordUpserteed do
  subject(event) { RecordUpserteed.new("test-uuid", DataType{"apple" => 1}, 100000.0) }

  it "has key, value, timestamp" do
    expect(event.uuid).to eq "test-uuid"
    expect(event.data).to eq ({"apple" => 1})
    expect(event.timestamp).to eq 100000.0
  end

  context "validation exceptions" do
    let(uuid) { "uuid" }
    let(data) { DataType{"key" => 1} }
    let(timestamp) { 1.0 }

    subject(inputs) do
      {uuid: uuid, data: data, timestamp: timestamp}
    end

    provided uuid = "" do
      expect { RecordUpserteed.new(**inputs) }.to raise_error(UUIDBlankException)
    end
    provided timestamp = 0.0 do
      expect { RecordUpserteed.new(**inputs) }.to raise_error(TimestampBlankException)
    end
    provided timestamp = -1.0 do
      expect { RecordUpserteed.new(**inputs) }.to raise_error(TimestampInvalidException)
    end
  end
end
