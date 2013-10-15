module Msgpack
  module Rpc2
    class ConnectionPool
      def self.for(addr="", port=0)
        @@pool ||= Hash.new do |hash, addr|
          hash[addr] = Connection.new(addr)
        end
        key = "#{addr}:#{port}"
        @@pool[key]
      end
    end
  end
end
