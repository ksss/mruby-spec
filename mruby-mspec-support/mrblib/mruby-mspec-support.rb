# Define functionality needed by mspec and missing from MRuby

RUBY_PLATFORM = "mruby"

class File
  Separator = SEPARATOR
  class << self
    def executable?(path)
      File::Stat.new(path).executable?
    end

    def readable?(path)
      File::Stat.new(path).readable?
    end

    def writable_real?(path)
      File::Stat.new(path).writable_real?
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

module Kernel
  def abort(message)
    $stderr.puts message
    raise SystemExit
  end

  def <=>(o)
    if self == o
      0
    else
      nil
    end
  end
end

class Module
  alias private_instance_methods instance_methods
  def private_constant(*)
    self
  end
  def private_class_method(*)
    self
  end
  def public_class_method(*)
    self
  end
  def nesting
  end
  def autoload(const_name, feature)
    require feature
  end

  prepend Module.new {
    def define_method(name, obj = nil, &block)
      if block
        super(name, &block)
      elsif obj && obj.instance_of?(Method) || obj.instance_of?(UnboundMethod)
        if method_proc = obj.instance_variable_get(:@proc)
          super(name, &method_proc)
        else
          raise TypeError, "bind argument must be a subclass of #{obj.owner}"
        end
      elsif obj.instance_of?(Proc)
        super(name, &obj)
      else
        super
      end
    end
  }
end

class Object
  def taint(*)
    self
  end

  def tainted?(*)
    false
  end

  def untrust(*)
    self
  end

  def untrusted?(*)
    false
  end
end

class Encoding
  US_ASCII = -1
  ASCII_8BIT = -1
  UTF_8 = -1
  ISO_8859_1 = -1
  UTF_16LE = -1
  ISO_8859_5 = -1
  CompatibilityError = Class.new(StandardError)
  def initialize(*)
  end
end

class String
  def encode(*)
    self
  end

  def encoding(*)
    Encoding::ASCII_8BIT
  end

  def force_encoding(*)
    self
  end
end

Signal.trap(:SIGABRT) {
  puts "SIGABRT from"
  puts caller.join("\n")
}
Signal.trap(:SIGSEGV) {
  puts
  puts "!!! catch SIGSEGV !!!"
  puts "-- Ruby level backtrace information ----------------------------------------"
  puts caller.join("\n")
  Signal.trap(:SIGSEGV, 'DEFAULT')
}
