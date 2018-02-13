require 'erb'

class  BaseController
  def initialize(request)
    @request = request
  end

  def render(name, data = {})
    template_file = "#{name}.html.erb"

    file_path = prependTemplatesPath(template_file)

    if File.exists?(file_path)
      self.response(200, renderFile(file_path))
    else
      "ERROR: no available template file #{file_path}"
    end
  end

  def prependTemplatesPath(file_name)
    File.expand_path(File.join("../../views", file_name), __FILE__)
  end

  def renderFile(file_path)
    raw = File.read(file_path)
    ERB.new(raw).result(binding)
  end

  def response(code, output) 
    ["#{code}", {'Content-Type' => 'text/html'}, ["#{output}"]] 
  end

end