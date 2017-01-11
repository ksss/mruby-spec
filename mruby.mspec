class MSpecScript
  set :target, File.expand_path("mruby/bin/mruby", File.dirname(__FILE__))

  set :prefix, 'spec'

  # Features
  MSpec.disable_feature :fiber
  MSpec.disable_feature :fiber_library
  MSpec.disable_feature :continuation_library
  MSpec.disable_feature :fork
  MSpec.disable_feature :encoding
  MSpec.disable_feature :readline

  Dir["unsupported/**/*.txt"].each do |path|
    File.open(path).each_line do |line|
      MSpec.register :exclude, line.chomp!
    end
  end
end

# work around patches for mruby-require
$LOAD_PATH = $:
$LOADED_FEATURES = $"
