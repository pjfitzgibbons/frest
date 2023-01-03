
require "./command_service"
require "./event_service"

class Services
    getter :command, :event, :projector
    def initialize
        @command = CommandService.new
        @event = EventService.new
    end
end
