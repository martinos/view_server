require 'clipboard'

module ViewServer
  class MyClipboard
    def self.copy(data)
      puts "Copy called"
      Clipboard.copy(data)
    end

    def self.paste
      puts "Paste called"
      Clipboard.paste
    end
  end
end
