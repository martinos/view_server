require 'drb'

module ViewServer
  class Server
    # I wanted to use the display method but it conflicts 
    # with the Object#display method
    def show(data, file_ext = 'txt')
      TmpFile.open("", "." + file_ext) do |a|
        a << data
        a.close
        `open #{a.path} `
        sleep 5 #We don't want to delete the file before it's loaded
      end
    end

    def to_cb(data) # To clipboard
      File.open("#{ENV['HOME']}/tmp/clipboard", "w"){|a| a << data}
      IO.popen('pbcopy', 'w'){|a| a << data}
    end

    def paste # From clipboard
      `pbpaste`
    end

    def self.serve(port)
      DRb.start_service "druby://localhost:#{port}", Server.new
      puts DRb.uri
      DRb.thread.join
    end
  end
end
