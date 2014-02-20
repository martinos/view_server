require 'drb'
require 'delegate'
require 'view_server/my_clipboard'

module ViewServer
  class Client < Delegator
    attr_reader :server

    def initialize(port = 10021)
      DRb.start_service
      @server = DRbObject.new(nil, "druby://localhost:#{port}")
    end

    def __getobj__
      @server
    end
  end
end
