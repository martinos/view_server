module ViewServer
  class CbPasteRunner
    def self.run
      $stdout << ViewServer::Client.new.server.paste
binding.pry
    end
  end
end
