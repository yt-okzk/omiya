require 'omiya/client'

describe Omiya::Client do
  describe '#get' do
    before :each do
      Omiya::Client.setup
    end

    let(:cli) { Omiya::Client.new }

    it 'should return the value of the key which @@store is matched with' do
      Omiya::Client.class_eval("@@store['hoge'] = :fuga")
      cli.get('hoge').should == :fuga
    end

    it 'should return the value of the key which @@regexp is matched with' do
      Omiya::Client.class_eval("@@store['hoge']   = :fuga")
      Omiya::Client.class_eval('@@regexp[/^hoge/] = :bar')
      cli.get('hoge').should         == :fuga
      cli.get('hogeeee').should      == :bar
      cli.get('fugahoge').should_not == :bar
    end
  end

  describe '#set' do
    before :each do
      Omiya::Client.setup
    end

    let(:cli) { Omiya::Client.new }

    context 'when key is String' do
      it 'should set to @@store' do
        cli.set('hoge', :fuga)

        cli.get('hoge').should == :fuga
      end
    end

    context 'when key is Regexp' do
      it 'should set to @@regexp' do
        cli.set(/^ho/, :fuga)

        cli.get('ho').should       == :fuga
        cli.get('hoge').should     == :fuga
        cli.get('huge').should_not == :fuga
      end
    end

    context 'when key is object of not permitted class' do
      it 'should raise Exception' do
        expect { cli.set([], :fuga) }.to raise_error Exception
      end
    end
  end
end
