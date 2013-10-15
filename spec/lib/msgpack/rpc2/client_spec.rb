require 'spec_helper'

describe Msgpack::Rpc2::Client do
  let(:conn) { double('Connection') }
  let(:client) { Msgpack::Rpc2::Client.new(conn) }

  describe '#func' do
    let(:sum_func) { client.func('sum') }

    it 'should return Msgpack::Rpc2::Func instance' do
      expect(sum_func).to be_instance_of(Msgpack::Rpc2::Func)
    end

    it 'should pass conn to Msgpack::Rpc2::Func' do
      expect(sum_func.instance_variable_get(:@conn)).to be(conn)
    end

    it 'should pass name to Msgpack::Rpc2::Func' do
      expect(sum_func.instance_variable_get(:@name)).to be_eql("sum")
    end

    it 'should pass default arguments to Msgpack::Rpc2::Func' do
      multiply_2x = client.func('mult', 2)
      expect(multiply_2x.instance_variable_get(:@args)).to be_eql([2])
    end
  end

  describe '#namespace' do
    let(:ns1) { client.namespace('Arith') }

    it 'should return self namespaced dup' do
      ns1.instance_variable_get(:@namespace).should == 'Arith'
    end

    it 'should pass name with namespace to Msgpack::Rpc2::Func' do
      arith_sum = ns1.func('sum')
      expect(arith_sum.instance_variable_get(:@name)).to be_eql('Arith.sum')
    end
  end
end
