module Omiya
  class Client
    @@store = {}
    def get(key)
      @@store[key]
    end

    def set(key, value)
      @@store[key] = value
      self
    end
  end
end
