module Msgpack
  module Rpc2
    class Client
      attr_writer :namespace

      def initialize(conn, namespace=nil)
        @conn, @namespace = conn, namespace
      end

      def func(name="", *args)
        Msgpack::Rpc2::Func.new(@conn, _namespace(name), args)
      end

      def namespace(name)
        self.dup.tap {|o| o.namespace = _namespace(name) }
      end

      private
      def _namespace(name="")
        @namespace ? [@namespace, name].join(".") : name
      end
    end
  end
end
