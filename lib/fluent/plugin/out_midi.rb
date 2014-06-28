module Fluent
  class MIDIOutput < Fluent::Output
    Fluent::Plugin.register_output('midi', self)

    config_param :port, :integer, :default => 0

    def initialize
      super
      require 'rtmidi'
    end

    def configure(conf)
      super
    end

    def start
      super
      @output = RtMidi::Out.new
      @output.open_port(port)
    end

    def shutdown
      super
    end

    def emit(tag, es, chain)
      chain.next
      es.each do |time, record|
        status   = record['status']   || 0x90 # note on
        note     = record['note']     || 0
        velocity = record['velocity'] || 0
        duration = record['duration']

        @output.send_channel_message(status, note, velocity)
        if duration
          sleep duration
          @output.send_channel_message(status, note, 0)
        end
      end
    end
  end
end
