require 'spec_helper'
require 'omiya/server'

describe Omiya::Server do
  describe '.start' do
    before :each do
      extend Omiya
      get 'hoge' do
        'fuga'
      end

      get /hoge/ do |key|
        'a'
      end
    end

    it 'should call Client#get' do
      server = stub('Server')
      client = stub('Client')
      client.stub(:gets).and_return('GET hoge', 'GET hogehoge', 'barusu')
      client.stub(:close).and_return
      server.stub(:accept).and_return(client)
      server.stub(:close)
      Omiya::Server.stub(:loop).and_yield

      TCPServer.should_receive(:open).with(5757).and_return(server)
      Omiya.client.should_receive(:get).with('hoge')
      Omiya.client.should_receive(:get).with('hogehoge')

      Omiya::Server.start
    end
  end
end
