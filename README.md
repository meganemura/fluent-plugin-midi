# MIDI output plugin for [Fluentd](http://fluentd.org/)

Experimental project for log audiolization.

## Installation

```
$ gem install fluent-plugin-midi
```

## Usage

```
echo '{"status":144, "note": 60, "velocity": 120}' | fluent-cat debug
echo '{"status":144, "note": 60, "velocity": 0}'   | fluent-cat debug
```

or

```
echo '{"status":144, "note": 60, "velocity": 120, "duration": 3}' | fluent-cat debug
```

## Configuration

```
<match pattern>
  type midi
  port MIDI_PORT_INDEX
</match>
```

**port**

  To list midi port index
  ```ruby
  require 'rtmidi'
  output = RtMidi::Out.new
  puts output.port_nemes.each_with_index.to_a.inspect
  # => [["IAC Driver port0", 0], ["IAC Driver port1", 1], ["MIDI Monitor (midimon.mMon)", 2]]
  ```

## Contributing

1. Fork it ( http://github.com/meganemura/fluent-plugin-midi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
