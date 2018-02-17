require_relative 'base_controller'


class AlbumController < BaseController 

	def view_albums
		# Read the data from the file.
    	album_model = Model.new("top_100_albums.txt")
    	@table_data = album_model.load_from_file

    	if (@request.params.has_key?('sort_by'))
      	@table_data = album_model.sort_data_by_key(@request.params['sort_by'], @table_data)
    	end
    	@highlighted_index = (@request.params.has_key?('highlighted_index') ? @request.params['highlighted_index'] : nil).to_i
	    response(200, render_erb_file('app/views/album.html.erb'))
	end

end
