module Msgpack
  module Rpc2
    class ConnectionPool
      def self.for(addr="", port=0)
        @@pool ||= Hash.new do |hash, key|
          a, p = key.split(":")
          p = p.to_i
          hash[key] = TCPSocket.new a, p
        end
        key = "#{addr}:#{port}"
        @@pool[key]
      end
    end
  end
end
