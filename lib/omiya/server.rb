require 'socket'
require 'omiya'

module Omiya
  class Server
    def self.start(port = nil)
      port ||= 5757
      server = TCPServer.open(port)

      client = server.accept

      loop do
        while line = client.gets
          case line.chomp
          when /^barusu$/
            break
          when /^(get|GET)\s+(?<key>[^\s]+)$/
            Omiya.client.get($~[:key])
          when /^set\s+(?<key>[^\s]+) (?<value>[^\s]+)$/
            # TODO
          else
            "ERROR\r\n"
          end
        end
        client.close
      end
      server.close
    end
  end
end
