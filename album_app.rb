require 'csv'
require_relative 'app/models/model'
require_relative 'app/controllers/album_controller'

class AlbumApp

  def initialize(router)
    @router = router
  end

  def call(env)
    @router.dispatch(Rack::Request.new(env))
  end

end