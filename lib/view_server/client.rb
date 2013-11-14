require 'drb'

module ViewServer
  class Client
    attr_reader :server

    def initialize(port = 10021)
      DRb.start_service
      @server = DRbObject.new(nil, "druby://localhost:#{port}")
    end
  end
end
