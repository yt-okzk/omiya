module Omiya
  class Client
    class << self
      def setup
        @@store  = {}
        @@regexp = {}
      end
    end

    def get(key)
      return @@store[key] if @@store[key]

      @@regexp.each do |regexp, value|
        return value if regexp =~ key
      end

      nil
    end

    def set(key, value)
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
