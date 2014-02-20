require 'clipboard'

module ViewServer
  class MyClipboard
    def self.copy(data)
      Clipboard.copy(data)
    end

    def self.paste
      Clipboard.paste
    end
  end
end
