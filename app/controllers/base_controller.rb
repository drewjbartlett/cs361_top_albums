require 'erb'
require_relative '../utils/paths'

class  BaseController
  include Paths

  def initialize(request)
    @request = request
  end

  def render(file_name, response_code = 200)
    file_path = views_path(get_file_name(file_name))

    if File.exists?(file_path)
      response(response_code, render_file(file_path))
    else
      response(404, "#{file_path} not found")
    end
  end

  def render_partial(file_name)
    file_path = views_path(get_file_name(file_name))

    render_file(file_path)
  end

  def get_file_name(file_name)
    "#{file_name}.html.erb"
  end

  def render_file(file_path)
    raw = File.read(file_path)
    ERB.new(raw).result(binding)
  end

  def response(code, output) 
    ["#{code}", {'Content-Type' => 'text/html'}, ["#{output}"]] 
  end

end