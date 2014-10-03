# MIDI Input/Output plugin for [Fluentd](http://fluentd.org/)
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/meganemura/fluent-plugin-midi?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Gem Version](https://img.shields.io/gem/v/fluent-plugin-midi.svg)](http://badge.fury.io/rb/fluent-plugin-midi)
[![Code Climate](https://img.shields.io/codeclimate/github/meganemura/fluent-plugin-midi.svg)](https://codeclimate.com/github/meganemura/fluent-plugin-midi)
[![Dependency Status](https://gemnasium.com/meganemura/fluent-plugin-midi.svg)](https://gemnasium.com/meganemura/fluent-plugin-midi)


Experimental project for log audiolization.

## Installation

```
$ gem install fluent-plugin-midi
```

## Usage

 * Output
```
echo '{"status":144, "note": 60, "velocity": 120}' | fluent-cat debug
sleep 3
echo '{"status":144, "note": 60, "velocity": 0}'   | fluent-cat debug
```

or

```
echo '{"status":144, "note": 60, "velocity": 120, "duration": 3}' | fluent-cat debug
```

## Configuration

 * Input
```
<source>
  type midi
  tag  TAG
  port MIDI_PORT_INDEX
</source>
```

 * Output
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
