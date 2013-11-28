module ViewServer
  class Launcher
    def launch(data, file_ext = 'txt')
      TmpFile.open("", "." + file_ext) do |a|
        a << data
        a.close
        `open #{a.path} `
        sleep 5 #We don't want to delete the file before it's loaded
      end
    end
  end
end
