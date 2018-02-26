require 'csv'
require_relative 'paths'
require_relative '../models/album_model'

module AlbumLoader

  def self.load_from_file(file_name)
    [].tap do |albums|
      CSV.foreach(Paths::data_path(file_name)) do |row|
        albums << AlbumModel.new($., row[0], row[1])
      end
    end
  end

end