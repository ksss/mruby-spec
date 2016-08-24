# This file is missing collection by mruby

module RbConfig
  CONFIG = {
    "RUBY_INSTALL_NAME" => "mruby",
    "bindir" => "mruby/bin",
  }
end

class File
  class << self
    def executable?(file)
      File::Stat.new(file).executable?
    end
  end
end

class Dir
  class << self
    alias [] glob
  end
end

class SystemExit < Exception
end

RUBY_PLATFORM = ""
RUBY_PATCHLEVEL = 0
$: << File.dirname(File.dirname(File.dirname(File.dirname(File.dirname(__FILE__)))))

module Kernel
  def abort(message)
    $stderr.puts message
    raise SystemExit
  end
end
