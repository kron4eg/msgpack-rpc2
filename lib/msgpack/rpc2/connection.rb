require 'pp'

module Msgpack
  module Rpc2
    class Connection
      def initialize(addr_port)
        @addr, @port = addr_port.split(":")
        @port = @port.to_i
      end

      def read
      end

      def write(data)
        sock.write(data)
      end

      private

      def sock
        if !@sock || @sock.closed?
          @sock = TCPSocket.new @addr, @port
        end
        @sock
      end
    end
  end
end
