require "socketry"

module ChromeRemote
  class Socket
    attr_reader :url, :io

    def initialize(url)
      uri = URI.parse(url)

      @url = url
      @socket = Socketry::TCP::Socket.connect(uri.host, uri.port, timeout: 30)
      @io = @socket.to_io
    end
    
    def write(data)
      io.print data
    end

    def read
      io.readpartial(1024)
    end
  end
end
