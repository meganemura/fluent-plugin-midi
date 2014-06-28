require 'helper'

class MIDIOutputTest < Test::Unit::TestCase

  def setup
    Fluent::Test.setup
  end

  CONFIG = %[
  ]

  def create_driver(conf = CONFIG)
    Fluent::Test::OutputTestDriver.new(Fluent::MIDIOutput).configure(conf)
  end

  def test_configure
  end

  def test_emit
  end
end
