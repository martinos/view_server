module ViewServer
  class CbPasteRunner
    def self.run
      $stdout << ViewServer::Client.new.server.paste
    end
  end
end
