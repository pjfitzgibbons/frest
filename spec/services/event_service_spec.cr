require "../spec_helper"
require "../../src/event"
require "../../src/event/record_upserted"
require "../../src/services/event_service"

Spectator.describe EventService do
    subject(service) { EventService.new }

    it "has event log" do
        expect(service.event_log).to eq [] of Event
    end

    it "appends to event log" do
        evt = RecordUpserteed.new("uuid", "a", 1, 1.0)
        service.receive_events([evt])

        expect(service.event_log).to eq [evt]
    end
end

