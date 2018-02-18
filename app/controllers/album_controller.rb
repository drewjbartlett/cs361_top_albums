require_relative 'base_controller'
require_relative '../models/base_model'

class AlbumController < BaseController
  def index()
    # create the album
    album_model = BaseModel.new('top_100_albums.txt')

    # load the data from the file
    @albums = album_model.load_from_file

    # sort the data if we have a valid sort key
    if (@request.params.has_key?('sort_by'))
      @albums = album_model.sort_data_by(@request.params['sort_by'], @albums)
    end

    # set the table headers
    @table_headers = [
      { sort_key: 'number', name: '#' },
      { sort_key: 'name', name: 'Name' },
      { sort_key: 'year', name: 'Year' },
    ]

    # set some helper variables for the query params
    @highlighted_index = (@request.params.has_key?('highlighted_index') ? @request.params['highlighted_index'] : nil).to_i
    @sorted_by = (@request.params.has_key?('sort_by') ? @request.params['sort_by'] : nil)

    # render the template
    self.render('albums')
  end

  def get_sort_by_link(sort_key)
    sort_by_link = "?sort_by=#{sort_key}"
    sort_by_link + (@highlighted_index != 0 ? "&highlighted_index=#{@highlighted_index}" : '')
  end
end
