require 'spec_helper'

describe Msgpack::Rpc2::Func do
  let(:conn) { double('Connection') }
  let(:d_args) { [] }
  let(:sum_func) { Msgpack::Rpc2::Func.new(conn, 'sum', d_args) }

  describe '#call' do
    it 'should serialize args and write to connection' do
      args = [1, 2]
      call_spec = [0, 'sum', args]
      conn.should_receive(:write).with(MessagePack.pack(call_spec))
      sum_func.call(*args)
    end

    context 'when default arguments' do
      let(:d_args) { [10] }

      it 'should use default arguments + arguments provided to call' do
        args = [1, 2]
        call_spec = [0, 'sum', d_args + args]
        conn.should_receive(:write).with(MessagePack.pack(call_spec))
        sum_func.call(*args)
      end
    end
  end

  describe '#notify' do
    it 'should serialize args and write to connection' do
      args = [1, 2]
      call_spec = [2, 'sum', args]
      conn.should_receive(:write).with(MessagePack.pack(call_spec))
      sum_func.notify(*args)
    end

    context 'when default arguments' do
      let(:d_args) { [10] }

      it 'should use default arguments + arguments provided to call' do
        args = [1, 2]
        call_spec = [2, 'sum', d_args + args]
        conn.should_receive(:write).with(MessagePack.pack(call_spec))
        sum_func.notify(*args)
      end
    end
  end
end
