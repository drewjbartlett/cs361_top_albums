require_relative 'paths'

class Router
  include Paths

  def initialize()
    @routes = Hash.new
  end

  def register(route, handler)
    @routes.store(route, {
      handler: handler,
    })
  end

  def dispatch(request)
    path = request.env.fetch('PATH_INFO')
    
    if (@routes.has_key?(path))
      route = @routes.fetch(path)
      call_controller_method(route[:handler], request)
    else
      response(404, "<h1>#{path} not found</h1>")  
    end
  end

  def call_controller_method(controllerPath, request)
    controllerName, methodName = controllerPath.split('@')

    load_controller(controllerName)
    
    controller = Object.const_get(controllerName)
    controller = controller.new(request)

    controller.send(methodName)
  end

  def load_controller(controllerName)
    require_relative controllers_path('album_controller')
  end

end