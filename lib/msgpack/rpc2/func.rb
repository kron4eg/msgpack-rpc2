module Msgpack
  module Rpc2
    class Func
      def initialize(addr, name, args)
        @addr, @name, @args = addr, name, args
      end

      def call(*args)
        [0, @name, @args + args]
      end

      def notify(*args)
        [2, @name, @args + args]
      end
    end
  end
end
