require 'clip'

module ViewServer
  class Runner
    def self.run
      options = Clip do |p|
        p.flag 's', 'server',:desc => 'Is a server', :default => false

        p.optional 'p', 'port', :desc => 'The port', :default => 10021 do |v|
          v.to_i # always deal with integers
        end
        p.flag 'c', 'copy_to_clipboard', :desc => "Send to clipboard" 
        p.flag 'P', 'paste_from_clipboard', :desc => "Read from clipboard" 
        p.flag 'v', 'verbose', :desc => 'Make it chatty'
      end

      if options.valid?
        if options.verbose?
          puts options.host
          puts options.port
          puts 'files:'
          options.files.each do |f|
            puts "\t#{f}"
          end
        end
        if options.server?
          Server.serve(options) 
        else
          Client.new(options.port).send(options) 
        end
      else
        # print error message(s) and usage
        $stderr.puts options.to_s
      end
    end
  end
end
