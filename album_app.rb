require 'csv'
require_relative 'app/models/model'
require_relative 'app/controllers/controller'

class AlbumApp

  def call(env)
    request = Rack::Request.new(env)
    
    response_body = "<h1>Top 100 Albums of All Time</h1>"
    # Read the data from the file.
    album_model = Model.new("top_100_albums.txt")
    table_data = album_model.load_from_file

    if (request.params.has_key?('sort_by'))
      puts "sorting"
      table_data = album_model.sort_data_by_key(request.params['sort_by'], table_data)
    end

    response_body << render_data_to_table(table_data)
    album_controller = Controller.new(request)
    # Send the response
    album_controller.response(200, response_body)

  end

 

  def render_data_to_table(table_data)
 
    response_body = ""

    response_body << "<table>"
      response_body << "<thead><tr>"
        response_body << '<th><a href="?sort_by=number">Rank</a></th>'        
        response_body << '<th><a href="?sort_by=title">Name</a></th>'        
        response_body << '<th><a href="?sort_by=year">Year</a></th>'            
      response_body << "</tr></thead>"
      response_body << "<tbody>"
        table_data.each {|row| response_body << "<tr><td>#{row[:number]}</td><td>#{row[:title]}</td><td>#{row[:year]}</td></tr>"}
      response_body << "</tbody>"
    response_body << "</table>"

    response_body

  end

end