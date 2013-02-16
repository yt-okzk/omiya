require 'spec_helper'
require 'omiya'

describe Omiya do
  before :each do
    extend Omiya
  end

  describe '.client' do
    it 'should get @@client' do
      Omiya.client.should == Omiya.class_eval('@@client')
    end
  end

  describe '.client=' do
    it 'should set @@client' do
      Omiya.client = :hoge
      Omiya.class_eval('@@client').should == :hoge
    end
  end

  describe '.setup' do
    it 'should initialize @@client' do
      Omiya.client = :hoge
      Omiya.setup
      Omiya.class_eval('@@client').should_not == :hoge
      Omiya.class_eval('@@client').should be_an_instance_of(Omiya::Client)
    end
  end

  describe '#get' do
    before :each do
      Omiya::Client.setup
    end

    let(:cli) { Omiya.client }

    it 'should raise NoBlockGivenException when block is not given' do
      expect { get('hoge') }.to raise_error Omiya::NoBlockGivenException
    end

    it 'should return a client which returns the value set' do
      get 'hoge' do
        'fuga'
      end

      cli.get('hoge').should == 'fuga'
    end

    it 'should yield key' do
      get 'hoge' do |key|
        "#{key} fuga"
      end

      get /^hoge/ do |key|
        key.size
      end

      cli.get('hoge').should     == 'hoge fuga'

      cli.get('hogea').should    == 5
      cli.get('hogefuga').should == 8
    end
  end
end
