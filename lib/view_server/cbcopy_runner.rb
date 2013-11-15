require 'main'

module ViewServer
  class CbCopyRunner
    def self.run
      content = $stdin.read
      ViewServer::Client.new.server.to_cb(content)
    end
  end
end

