require "socketry"

module ChromeRemote
  class Socket
    attr_reader :url, :io

    def initialize(url, timeout=30)
      uri = URI.parse(url)
      @timeout = timeout
      @url = url
      @socket = Socketry::TCP::Socket.connect(uri.host, uri.port, timeout: @timeout)
      @io = @socket.to_io
    end
    
    def write(data)
      @socket.write data
    end

    def read
      @socket.readpartial(1024, timeout: @timeout)
    end
    
  end
end
