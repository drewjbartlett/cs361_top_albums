require_relative 'base_controller'
require_relative '../models/base_model'

class AlbumController < BaseController
  def index()
    @album_model = BaseModel.new('top_100_albums.txt')
    @albums = @album_model.load_from_file

    @highlighted_index = (@request.params.has_key?('highlighted_index') ? @request.params['highlighted_index'] : nil).to_i

    self.render('albums')
  end
end