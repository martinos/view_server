require 'optparse'

module ViewServer
  class ShowRunner
    def self.parse(args)
      options = {:port => 10021}
      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: show [options] [file]"

        opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
          options[:verbose] = v
        end

        opts.on("-e", "--extension EXTENSION", "File extension") do |v|
          options[:ext] = v
        end

        opts.on("-p", "--port PORT", "Port number. Default is 10021") do |v|
          options[:port] = Integer(v)
        end
      end

      opt_parser.parse!(args)

      filename = ARGV.first
      if filename
        data = File.read filename
        ext = File.extname(filename)[1..-1]
      else
        data = $stdin.read
        ext = options.fetch(:ext) {'txt'}
      end

      options.merge({:data => data, :ext => ext })
    end

    def self.run(args, launcher = Launcher.new)
      opts = parse(args)

      if opts[:port] == -1
        ViewServer::Server.new(launcher).show(opts[:data], opts[:ext])
      else
        ViewServer::Client.new(opts[:port]).show(opts[:data], opts[:ext])
      end
    end
  end
end
