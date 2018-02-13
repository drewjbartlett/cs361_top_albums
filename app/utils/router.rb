require_relative '../controllers/album_controller'

class Router

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
      self.callControllerMethod(route[:handler], request)
    else
      self.response(404, "<h1>#{path} not found</h1>")  
    end
  end

  def callControllerMethod(controllerPath, request)
    controllerName, methodName = controllerPath.split('@')
    controller = Object.const_get(controllerName)
    controller = controller.new(request)

    controller.send(methodName)
  end

end