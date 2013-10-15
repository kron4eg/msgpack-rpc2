module Msgpack
  module Rpc2
    class Func
      def initialize(conn, name, args)
        @conn, @name, @args = conn, name, args
      end

      def call(*args)
        msg = serialize([0, @name, @args + args])
        @conn.write(msg)
      end

      def notify(*args)
        msg = serialize([2, @name, @args + args])
        @conn.write(msg)
      end

      private
      def serialize(what)
        MessagePack.pack(what)
      end
    end
  end
end
