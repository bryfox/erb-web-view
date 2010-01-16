# ErbRendering is just a stripped-down version of Sinatra's rendering code
# http://www.sinatrarb.com/
module ErbRendering
  
  def partial(page, options={})
    erb page, options.merge!(:layout => false, :views => "#{ROOT_DIR}/views/partials")
  end
  
  def erb(template, options={}, locals={})
    require_warn('ERB') unless defined?(::ERB)

    render :erb, template, options, locals
  end
  

  def render(engine, template, options={}, locals={})
    # extract generic options
    locals = options.delete(:locals) || locals || {}
    views = options.delete(:views) || "./views"

    # render template
    data, options[:filename], options[:line] = lookup_template(engine, template, views)
    output = __send__("render_#{engine}", template, data, options, locals)

    output
  end

  def lookup_template(engine, template, views_dir, filename = nil, line = nil)
    case template
    when Symbol
      path = ::File.join(views_dir, "#{template}.#{engine}")
      [ ::File.read(path), path, 1 ]
    else
      raise ArgumentError
    end
  end
  
  def render_erb(template, data, options, locals, &block)
    original_out_buf = defined?(@_out_buf) && @_out_buf
    data = data.call if data.kind_of? Proc

    instance = ::ERB.new(data, nil, nil, '@_out_buf')
    locals_assigns = locals.to_a.collect { |k,v| "#{k} = locals[:#{k}]" }

    filename = options.delete(:filename) || '(__ERB__)'
    line = options.delete(:line) || 1
    line -= 1 if instance.src =~ /^#coding:/

    render_binding = binding
    eval locals_assigns.join("\n"), render_binding
    eval instance.src, render_binding, filename, line
    @_out_buf, result = original_out_buf, @_out_buf
    result
  end

end