# This file is missing collection by mruby

module RbConfig
  CONFIG = {
    "RUBY_INSTALL_NAME" => "mruby",
    "bindir" => "mruby/bin",
  }
end

class File
  Separator = SEPARATOR
  class << self
    def executable?(path)
      File::Stat.new(path).executable?
    end

    def readable?(path)
      File::Stat.new(path).readable?
    end

    def readlines(path)
      a = []
      File.open(path) do |f|
        while line = f.gets
          a << line
        end
      end
      a
    end

    def split(path)
      [File.dirname(path), File.basename(path)]
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
class Module
  alias private_instance_methods instance_methods
end
