class ThemesMacro

  AVAIABLE_THEMES = Dir[File.expand_path("../../assets/themes/*", __FILE__)].inject(['default']) do |themes, dir|
    themes << dir.split("/").last
    themes
  end
  
  
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
      <link rel="stylesheet" href="/plugin_assets/themes_macro/themes/#{@theme}/screen.css" type="text/css" media="screen" charset="utf-8">
    HTML
  end
  
  def can_be_cached?
    true
  end
  
end