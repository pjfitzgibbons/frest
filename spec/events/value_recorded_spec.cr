require "../spec_helper"
require "../../src/event"
require "../../src/event/value_recorded"

include Event

Spectator.describe ValueRecorded do
  subject(event) { ValueRecorded.new("test-uuid", "apple", 1, 100000.0) }

  it "has key, value, timestamp" do
    expect(event.uuid).to eq "test-uuid"
    expect(event.key).to eq "apple"
    expect(event.value).to eq 1
    expect(event.timestamp).to eq 100000.0
  end

  context "validation exceptions" do
    let(uuid) { "uuid" }
    let(key) { "key" }
    let(value) { 1 }
    let(timestamp) { 1.0 }

    subject(inputs) do
      {uuid: uuid, key: key, value: value, timestamp: timestamp}
    end

    provided uuid = "" do
      expect { ValueRecorded.new(**inputs) }.to raise_error(UUIDBlankException)
    end
    provided key = "" do
      expect { ValueRecorded.new(**inputs) }.to raise_error(KeyBlankException)
    end
    provided timestamp = 0.0 do
      expect { ValueRecorded.new(**inputs) }.to raise_error(TimestampBlankException)
    end
    provided timestamp = -1.0 do
      expect { ValueRecorded.new(**inputs) }.to raise_error(TimestampInvalidException)
    end
  end
end
