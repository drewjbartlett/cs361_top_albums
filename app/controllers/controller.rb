
class Controller

	def initialize(request)
		@request = request
	end

	def render_erb_file(file_path)
    raw = File.read(file_path)
    ERB.new(raw).result(binding)
  end

	def response(response_code, response_body)
		[response_code, {'Content-Type' => 'text/html'}, [response_body]]
	end 

end