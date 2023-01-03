require "../spec_helper"
require "../../src/event"
require "../../src/event/value_removed"

include Event

Spectator.describe ValueRemoved do
  subject(event) { ValueRemoved.new("test-uuid", "apple", 100000.0) }

  it "has key, value, timestamp" do
    expect(event.uuid).to eq "test-uuid"
    expect(event.key).to eq "apple"
    expect(event.timestamp).to eq 100000.0
  end

  context "validation exceptions" do
    let(uuid) { "uuid" }
    let(key) { "key" }
    let(timestamp) { 1.0 }

    subject(inputs) do
      {uuid: uuid, key: key,  timestamp: timestamp}
    end

    provided uuid = "" do
      expect { ValueRemoved.new(uuid: uuid, key: key, timestamp: timestamp) }.to raise_error(UUIDBlankException)
    end
    provided key = "" do
      expect { ValueRemoved.new(**inputs) }.to raise_error(KeyBlankException)
    end
    provided timestamp = 0.0 do
      expect { ValueRemoved.new(**inputs) }.to raise_error(TimestampBlankException)
    end
    provided timestamp = -1.0 do
      expect { ValueRemoved.new(**inputs) }.to raise_error(TimestampInvalidException)
    end
  end
end
