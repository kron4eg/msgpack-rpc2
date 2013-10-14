module Msgpack
  module Rpc2
    class Client
      def initialize(addr, namespace=nil)
        @addr, @namespace = addr, namespace
      end

      def func(name="", *args)
        Msgpack::Rpc2::Func.new(@addr, _namespace(name), args)
      end

      def namespace(name="")
        self.class.new(@addr, _namespace(name))
      end

      private
      def _namespace(name="")
        @namespace ? [@namespace, name].join(".") : name
      end
    end
  end
end
