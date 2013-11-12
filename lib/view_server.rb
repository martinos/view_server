require "view_server/version"

module ViewServer
  autoload :Server,  'view_server/server'
  autoload :Client,  'view_server/client'
  autoload :Runner,  'view_server/runner'
  autoload :TmpFile, 'view_server/tmp_file'
end
