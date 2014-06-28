module Fluent
  class MIDIOutput < Fluent::Output
    Fluent::Plugin.register_output('midi', self)
  end
end
