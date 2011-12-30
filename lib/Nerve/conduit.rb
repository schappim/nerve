require 'nerve'

class Nerve::Conduit

  def initialize callback = nil, socket = nil
    @callback = callback
    @socket = socket
  end

  # value in each case is expected to be
  #   a double      - sensor with value
  #   :edge         - simple off-on sensor
  #   freeform hash - a safety hatch for more complex operations.
  #

  def sendMessage value
    @socket.puts value if @socket
    $stderr.puts "#{value} was sent"
  end

  def receiveMessage value
    @callback.call(value) if @callback
  end
end
