module ViewHelpers

  # Renders HTML using bluecloth
  def render_markdown(text)
    BlueCloth.new(text).to_html
  end
  
  def toolbar(name, opts={})
    h =  '<div class="toolbar">'
    h << "  <h1>#{name}</h1>"
    h << '<a class="back" href="#">Back</a>' unless opts[:back] == false
    h << '</div>'
  end

end