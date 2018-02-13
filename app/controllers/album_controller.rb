require_relative 'base_controller'

class AlbumController < BaseController
  def index()
    @albums = [
      { name: 'Foo', year: 1234 },
      { name: 'Bar', year: 1237 },
    ]

    self.render('albums')
  end
end