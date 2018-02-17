
class Controller

	def initialize(request)
		@request = request
	end

	def response(response_code, response_body)
		[response_code, {'Content-Type' => 'text/html'}, [response_body]]
	end 

end