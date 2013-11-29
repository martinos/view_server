require 'drb'
require 'clipboard'

module ViewServer
  class Server
    attr_reader :launcher, :clipboard

    def initialize(launcher = Launcher.new)
      @launcher = launcher
      @clipboard = Clipboard
    end

    # I wanted to use the display method but it conflicts 
    # with the Object#display method
    def show(data, file_ext = 'txt')
      launcher.launch(data, file_ext)
    end

    def to_cb(data) # To clipboard
      clipboard.copy(data)
    end

    def paste # From clipboard
      clipboard.paste
    end

    def self.serve(launcher = Launcher.new, port)
      DRb.start_service "druby://localhost:#{port}", Server.new
      puts DRb.uri
      DRb.thread.join
    end
  end
end
