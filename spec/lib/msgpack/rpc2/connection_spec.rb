require 'spec_helper'

describe Msgpack::Rpc2::Connection do
  let(:conn) { Msgpack::Rpc2::Connection.new('127.0.0.1:1234') }
  let(:mock_conn) { double('TCPSocket', :closed? => false) }

  before do
    TCPSocket.should_receive(:new).with('127.0.0.1', 1234).and_return(mock_conn)
  end

  describe '#write' do
    it 'should pass data to underlying socket' do
      mock_conn.should_receive(:write).with('test')
      conn.write('test')
    end
  end
end
