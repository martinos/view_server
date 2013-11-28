$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'minitest/spec'
require 'minitest/autorun'
require 'mocha/setup'

require 'view_server'
require 'fileutils'
require 'stringio'
require 'open3'
require 'colored'
require 'pry'

class MiniTest::Spec
  BIN_DIR = File.join(File.dirname(File.expand_path(__FILE__)), '../bin' )
  LIB_DIR = File.join(File.dirname(File.expand_path(__FILE__)), '../lib' )

  def run_exe(executable, stdin_str, cmd_arg = [])
    env       = {"RUBYLIB" => "#{LIB_DIR}:#{ENV['RUBYLIB']}"}
    filepath  = File.join(BIN_DIR, executable)
    outstream = StringIO.new

    Open3.popen3(env, filepath, *cmd_arg) do |stdin, stdout, stderr, wait_thr|
      stdin << stdin_str
      stdin.close
      outstream << stdout.read
      raise_on_error(wait_thr.value, stderr, executable, stdout)
    end
    outstream.string
  end

  def capture_io(in_str)
    old_stdin, old_stdout = $stdin, $stdout
    $stdin = StringIO.new(in_str)
    $stdout = StringIO.new
    yield
  ensure
    out_str = $stdout.string
    $stdin, $stdout = old_stdin, old_stdout
    return out_str
  end

  def raise_on_error(status, stderr, executable, stdout)
    if ! status.success?
      msg = <<EOF
Error running #{executable}"
stdout:
#{stdout.read}

stderr:
#{stderr.read}

status:
#{status}
EOF
      raise msg
    end
  end
end
