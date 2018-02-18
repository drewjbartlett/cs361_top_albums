require 'csv'
require_relative 'app/models/model'
require_relative 'app/controllers/album_controller'

class AlbumApp

  def call(env)
  
    album_controller = AlbumController.new(Rack::Request.new(env))
    # Send the response
    album_controller.view_albums

  end

end