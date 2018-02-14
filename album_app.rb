require 'csv'

class AlbumApp

  def call(env)
    request = Rack::Request.new(env)
    
    response_body = "<h1>Top 100 Albums of All Time</h1>"
    # Read the data from the file.

    table_data = load_from_file

    if (request.params.has_key?('sort_by'))
      puts "sorting"
      table_data = sort_data_by_key(request.params['sort_by'], table_data)
    end

    response_body << render_data_to_table(table_data)

    # Send the response
    [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
  end

  def load_from_file
  	albums = []

  	CSV.foreach("top_100_albums.txt") do |row|
  		albums.push({ number: $., title: row[0], year: row[1] })
	   end

	   albums
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

  def sort_data_by_key(sort_key, data)
    data.sort_by {|row| 
      row = row[sort_key.to_sym]
      # strip quotes from the row if it's not the number key
      sort_key != 'number' ? row.gsub("'", '') : row
    }
  end

end