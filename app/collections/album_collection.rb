require_relative '../utils/album_loader'

class AlbumCollection
  attr_accessor :albums

  def initialize(file_name)
    @albums = AlbumLoader::load_from_file(file_name)
  end

  def sort_by_key(sort_key)
    valid_sort_keys = ['title', 'rank', 'year']

    if (valid_sort_keys.include?(sort_key))
      @albums.sort_by! {|album| 
        album_key = album.send(sort_key.to_sym)

        # strip quotes from the album if it's not the number key
        sort_key == 'title' ? album_key.gsub("'", '') : album_key
      }
    end
  end
  
end