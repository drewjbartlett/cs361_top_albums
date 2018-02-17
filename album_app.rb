require 'csv'
require_relative 'app/models/model'
require_relative 'app/controllers/album_controller'

class AlbumApp

  def call(env)
  
    album_controller = AlbumController.new(Rack::Request.new(env))
    # Send the response
    album_controller.view_albums

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