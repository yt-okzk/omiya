module Omiya
  class Client
    class << self
      def setup
        @@store  = {}
        @@regexp = {}
      end
    end

    def get(key)
      return @@store[key].call(key) if @@store[key]

      @@regexp.each do |regexp, value|
        return value.call(key) if regexp =~ key
      end

      nil
    end

    def set(key, value)
      raise Exception.new('value must be Proc object') unless value.is_a?(Proc)
      raise Exception.new('value must be Proc object, not lambda') if value.lambda?

      case key
      when String
        @@store[key]  = value
      when Regexp
        @@regexp[key] = value
      else
        raise Exception.new('key must be String or Regexp')
      end

      self
    end
    setup
  end
end
