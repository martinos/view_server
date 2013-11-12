require 'drb'

module ViewServer
  class Server
    def affiche(file_ext, data)
      TmpFile.open( "", "." + file_ext) do |a|
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

    def self.serve(options)
      DRb.start_service "druby://localhost:#{options.port}", Viewer.new
      puts DRb.uri
      DRb.thread.join
    end
  end
end
