require 'omiya/version'
require 'omiya/client'

module Omiya
  class NoBlockGivenException < Exception; end
  class << self
    def client
      @@client
    end

    def client=(cli)
      @@client = cli
    end

    def setup
      @@client = Omiya::Client.new
    end
  end

  def get(key, &block)
    raise Omiya::NoBlockGivenException.new if block.nil?

    @@client.set(key, block)
  end

  setup
end
