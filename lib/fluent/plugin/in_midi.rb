module Fluent
  class MIDIInput < Input
    Fluent::Plugin.register_input('midi', self)

    config_param :tag,  :string
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
      @input = RtMidi::In.new
      @input.receive_channel_message do |byte1, byte2, byte3|
        record = {
          'status'   => byte1,
          'note'     => byte2,
          'velocity' => byte3,
        }
        Engine.emit(@tag, Engine.now, record)
      end
      @input.open_port(@port)
    end

    def shutdown
      @input.close_port
    end
  end
end
