require "../event"

class EventService
    getter :event_log

    def initialize
        @event_log = [] of EventBase
    end

    def receive_events(events : Array(EventBase))
        @event_log += events
    end

end
