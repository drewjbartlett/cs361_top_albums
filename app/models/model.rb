
class Model

 def initialize(filename)
 	@filename = filename
 end

 def load_from_file
  	albums = []

  	CSV.foreach(@filename) do |row|
  		albums.push({ number: $., title: row[0], year: row[1] })
	end

	albums
  end

   def sort_data_by_key(sort_key, data)
    data.sort_by {|row| 
      row = row[sort_key.to_sym]
      # strip quotes from the row if it's not the number key
      sort_key != 'number' ? row.gsub("'", '') : row
    }
  end

end
