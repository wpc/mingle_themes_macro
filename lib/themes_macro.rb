# Copyright (c) 2010 ThoughtWorks Inc. (http://thoughtworks.com)
# Licenced under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0.txt)

class ThemesMacro

  AVAIABLE_THEMES = Dir[File.expand_path("../../assets/themes/*", __FILE__)].inject(['default']) do |themes, dir|
    themes << dir.split("/").last
    themes
  end
  
  PLUGIN_NAME = File.basename(File.expand_path("../..", __FILE__))
  
  
  def initialize(parameters, project, current_user)
    @theme = parameters["name"]
  end
  
  def execute
    return <<-HTML unless AVAIABLE_THEMES.include?(@theme)
    <p>
      <strong>Themes Macro:</strong>  Can not recogonize theme <strong>#{@theme}</strong>, currently supported themes are: #{AVAIABLE_THEMES.collect { |name| "<strong>#{name}</strong>" }.join(", ")}.
    </p>
    HTML
    
    return "" if @themes == "default"
    
    <<-HTML
      <link rel="stylesheet" href="#{file_link('screen.css')}" type="text/css" media="screen" charset="utf-8">
    HTML
  end
  
  def can_be_cached?
    true
  end
  
  private
  
  def file_link(css_file)
    "#{CONTEXT_PATH}/plugin_assets/#{PLUGIN_NAME}/themes/#{@theme}/#{css_file}"
  end
  
end