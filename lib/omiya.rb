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

  def get(key)
    raise Omiya::NoBlockGivenException.new unless block_given?

    @@client.set(key, yield)
  end

  setup
end
