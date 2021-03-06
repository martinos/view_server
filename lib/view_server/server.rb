require 'drb'
require 'clipboard'
require 'view_server/my_clipboard'

module ViewServer
  class Server
    attr_reader :launcher

    def initialize(launcher = Launcher.new)
      @launcher = launcher
      @clipboard = MyClipboard
    end

    # I wanted to use the display method but it conflicts 
    # with the Object#display method
    def show(data, file_ext = 'txt')
      launcher.launch(data, file_ext)
    end

    def copy(str)
      @clipboard.copy(str)
    end

    def paste
      @clipboard.paste
    end

    def self.serve(launcher = Launcher.new, port)
      DRb.start_service "druby://localhost:#{port}", Server.new
      puts DRb.uri
      DRb.thread.join
    end
  end
end
