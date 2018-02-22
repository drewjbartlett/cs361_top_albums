require_relative '../utils/album_loader'

class AlbumCollection

  attr_accessor :albums

  def initialize(file_name)
    @albums = AlbumLoader::load_from_file(file_name)
  end

  def sort_by_key(sort_key)
    valid_sort_keys = ['name', 'number', 'year']

    if (valid_sort_keys.include?(sort_key))
      @albums.sort_by {|row| 
        row = row[sort_key.to_sym]
        # strip quotes from the row if it's not the number key
        sort_key != 'number' ? row.gsub("'", '') : row
      }
    else
      @albums
    end
  end
end