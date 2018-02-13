require_relative 'base_controller'

class AlbumController < BaseController
  def index()
    @albums = [
      { name: 'Foo', year: 1234 },
      { name: 'Bar', year: 1237 },
      { name: 'qa', year: 1237 },
      { name: 'Bon', year: 1237 },
      { name: 'Fre', year: 1237 },
      { name: 'zin', year: 1237 },
    ]

    @albums = @albums.sort {|x,y| x[:name] <=> y[:name] }

    @highlightedIndex = (@request.params.has_key?('highlightedIndex') ? @request.params['highlightedIndex'] : nil).to_i

    self.render('albums')
  end
end