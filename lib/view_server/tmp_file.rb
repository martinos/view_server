require 'tmpdir'
require 'fileutils'
require 'digest'

module ViewServer
  class TmpFile
    def self.open(prefix = "", suffix= "")
      begin
        digest = Digest::MD5.hexdigest((Time.now.to_f + rand(10000)).to_s)
        file_name = File.join(Dir.tmpdir, prefix + digest + suffix )
        File.open(file_name, 'w+' ) do |f|
          yield f 
        end
      ensure
        FileUtils::rm(file_name) if File.exist?(file_name)
      end
    end
  end
end

