require 'spec_helper'

describe Msgpack::Rpc2::ConnectionPool do
  describe '.for' do
    it 'should accept exact two arguments' do
      expect {
        Msgpack::Rpc2::ConnectionPool.for('localhost', 0)
      }.to_not raise_error

      expect {
        Msgpack::Rpc2::ConnectionPool.for()
      }.to raise_error(ArgumentError)

      expect {
        Msgpack::Rpc2::ConnectionPool.for('localhost')
      }.to raise_error(ArgumentError)
      expect { }.not_to raise_error
    end

    it 'should cache Connection in @@pool' do
      con1 = Msgpack::Rpc2::ConnectionPool.for('localhost', 0)
      con2 = Msgpack::Rpc2::ConnectionPool.for('localhost', 0)
      expect(con1).to be(con2)
    end

    it 'should create new Connection for different addr/port' do
      con1 = Msgpack::Rpc2::ConnectionPool.for('localhost', 1)
      con2 = Msgpack::Rpc2::ConnectionPool.for('localhost', 2)
      expect(con1).to_not be(con2)
    end
  end
end
