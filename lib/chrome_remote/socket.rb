require "socketry"

module ChromeRemote
  class Socket
    attr_reader :url, :io

    def initialize(url)
      uri = URI.parse(url)

      @url = url
      @io = Socketry::TCP::Socket.new(uri.host, uri.port, timeout: 30)
    end
    
    def write(data)
      io.print data
    end

    def read
      io.readpartial(1024)
    end
  end
end
