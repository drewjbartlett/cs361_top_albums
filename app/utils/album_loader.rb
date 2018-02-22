require 'csv'
require_relative 'paths'
require_relative '../models/album_model'

module AlbumLoader

  def self.load_from_file(file_name)
    data = []

    CSV.foreach(Paths::data_path(file_name)) do |row|
      data.push(AlbumModel.new($., row[0], row[1]))
    end

    data
  end

end