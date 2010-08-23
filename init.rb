begin
  require 'macro_development_toolkit'
rescue LoadError
  require 'rubygems'
  require 'macro_development_toolkit'
end

if defined?(MinglePlugins)
  MinglePlugins::Macros.register(ThemesMacro, 'theme')
end