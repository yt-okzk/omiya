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
    it 'should raise NoBlockGivenException when block is not given' do
      expect { get('hoge') }.to raise_error Omiya::NoBlockGivenException
    end

    it 'should return a client which returns the value set' do
      omiya = get 'hoge' do
        'fuga'
      end

      omiya.should be_an_instance_of(Omiya::Client)
      omiya.get('hoge').should == 'fuga'
    end
  end
end
