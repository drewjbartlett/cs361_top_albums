require_relative 'paths'

class Router
  include Paths

  def initialize()
    @routes = Hash.new
  end

  # define a route and a handler
  def register(route, handler)
    @routes.store(route, {
      handler: handler,
    })
  end

  # dispatch a route via a given request
  def dispatch(request)
    path = request.env.fetch('PATH_INFO')
    
    if (@routes.has_key?(path))
      route = @routes.fetch(path)
      call_controller_method(route[:handler], request)
    else
      call_controller_method('Error@index', request)
    end
  end

  # instantiate and call a controller method
  def call_controller_method(controllerPath, request)
    controllerName, methodName = controllerPath.split('@')

    load_controller(controllerName)
    
    controller = Object.const_get("#{controllerName}Controller")
    controller = controller.new(request)

    controller.send(methodName)
  end

  # load a controller file
  def load_controller(controllerName)
    require_relative controllers_path("#{controllerName.downcase}_controller")
  end

end