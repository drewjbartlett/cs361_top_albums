require 'csv'

class AlbumApp

  def call(env)
    response_body = "<h1>Top 100 Albums of All Time</h1>"
    # Read the data from the file.
    @albums = loadFromFile

    response_body << "<table>"
      response_body << "<thead><tr>"
        response_body << "<th>Rank</th>"        
        response_body << "<th>Name</th>"        
        response_body << "<th>Year</th>"        
      response_body << "</tr></thead>"
      response_body << "<tbody>"
        @albums.each {|row| response_body << "<tr><td>#{row.to_s}</td><td>#{row.to_s}</td><td>#{row.to_s}</td></tr>"}
      response_body << "</tbody>"
    response_body << "</table>"

    # Send the response
    [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
  end

  def loadFromFile
  	albums = []

  	CSV.foreach("top_100_albums.txt") do |row|
  		albums.push({ number: 1, title: row[0], year: row[1] })
	end

	albums

  end

end