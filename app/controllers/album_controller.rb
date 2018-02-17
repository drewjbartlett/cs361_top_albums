require_relative 'base_controller'


class AlbumController < BaseController 

	def view_albums
		# Read the data from the file.
    	album_model = Model.new("top_100_albums.txt")
    	table_data = album_model.load_from_file

    	if (@request.params.has_key?('sort_by'))
      		puts "sorting"
      		table_data = album_model.sort_data_by_key(@request.params['sort_by'], table_data)
    	end

	    #response_body << render_data_to_table(table_data)
	    response(200, render_erb_file('app/views/album.html.erb'))
	end

end
