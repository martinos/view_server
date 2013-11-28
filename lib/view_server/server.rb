require 'drb'

module ViewServer
  class Server
    attr_reader :launcher

    def initialize(launcher = Launcher.new)
      @launcher = launcher
    end

    # I wanted to use the display method but it conflicts 
    # with the Object#display method
    def show(data, file_ext = 'txt')
      launcher.launch(data, file_ext)
    end

    def to_cb(data) # To clipboard
      File.open("#{ENV['HOME']}/tmp/clipboard", "w"){|a| a << data}
      IO.popen('pbcopy', 'w'){|a| a << data}
    end

    def paste # From clipboard
      `pbpaste`
    end

    def self.serve(launcher = Launcher.new, port)
      DRb.start_service "druby://localhost:#{port}", Server.new
      puts DRb.uri
      DRb.thread.join
    end
  end
end
