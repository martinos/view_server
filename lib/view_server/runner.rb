require 'main'

module ViewServer
  class Runner
    def self.run
      main.run
    end

    def self.main
      main = Main.new do
        option 'port', 'p' do
          cast :int
          default 10021
        end

        option 'verbose', 'v' do
          default false
        end

        def run
          puts "serving on port #{params['port']}"
          Server.serve params['port'].value
        end
      end
    end
  end
end
