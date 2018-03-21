require 'erb'

class ShowExceptions
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    app.call(env)
  rescue Exception => e
      render_exception(e)
    end
  end

  private

  def render_exception(e)
    dir_path = File.dirname(__FILE__)
    template_fname = File.join(dir_path, "templates")
    template = File.read(template_fname)
    body = ERB.new(template).result(binding)
    ['500',{'Content-type' => 'text/html'}, body]
  end

  def format_source(source_lines, source_line_num)
    start = [0, source_line_num - 3].max
    lines = source_lines[start..(start+5)]
    Hash[*(start+1..(lines.count + start)).zip(lines).flatten]
  end
end
