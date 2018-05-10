MRuby::Build.new do |conf|
  # load specific toolchain settings

  # Gets set by the VS command prompts.
  if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
    toolchain :visualcpp
  else
    toolchain :gcc
  end

  enable_debug

  conf.gembox 'full-core'
  conf.gem :mgem => "mruby-env"
  conf.gem :mgem => "mruby-dir-glob"
  conf.gem :mgem => "mruby-signal"
  conf.gem :mgem => "mruby-thread"
  conf.gem :mgem => "mruby-file-stat"
  conf.gem :mgem => "mruby-stringio"
  conf.gem :mgem => "mruby-uri", :github => "zzak/mruby-uri"
  conf.gem :mgem => "mruby-process"
  conf.gem :mgem => "mruby-at_exit"
  conf.gem :mgem => "mruby-onig-regexp"
  conf.gem :mgem => "mruby-catch-throw"
  conf.gem :github => 'haconiwa/mruby-exec'
  conf.gem 'mruby-mspec-support'
  # You can add gem what you want to testing
  # conf.gem :mgem => "your-gem"
  conf.gem :mgem => "mruby-require"
end
