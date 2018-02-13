require 'erb'
require_relative '../utils/paths'

class  BaseController
  include Paths

  def initialize(request)
    @request = request
  end

  def render(name, data = {})
    template_file = "#{name}.html.erb"

    file_path = views_path(template_file)

    if File.exists?(file_path)
      response(200, render_file(file_path))
    else
      response(404, "#{file_path} not found")
    end
  end

  def render_file(file_path)
    raw = File.read(file_path)
    ERB.new(raw).result(binding)
  end

  def response(code, output) 
    ["#{code}", {'Content-Type' => 'text/html'}, ["#{output}"]] 
  end

end