require 'drb'

module ViewServer
  class Client
    def initialize(port)
      DRb.start_service
      @server = DRbObject.new(nil, "druby://localhost:#{port}")
    end

    def send(options)
      if options.copy_to_clipboard?
        @server.to_cb(STDIN.read)
      elsif options.paste_from_clipboard?
        print obj.paste
      else
        if @server.remaining?
          affiche("csv", "2,4,5\n3,4,5")
        end  
      end
    end
  end
end
