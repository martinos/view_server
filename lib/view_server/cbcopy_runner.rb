require 'optparse'
require 'clipboard'

module ViewServer
  class CbCopyRunner
    def self.parse(args)
      options = {:port => 10021}
      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: show [options] [file]"

        opts.on("-p", "--port PORT", "Port number. Default is 10021") do |v|
          options[:port] = Integer(v)
        end
      end
      opt_parser.parse!(args)
      options
    end

    def self.run(args = [])
      opts = parse(args)
      server = if opts[:port] == -1
        ViewServer::Server.new(nil)
      else
        ViewServer::Client.new(opts[:port])
      end
      content = $stdin.read
      server.to_cb(content)
    end
  end
end

