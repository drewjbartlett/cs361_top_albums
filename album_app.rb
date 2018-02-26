require 'sinatra'
require_relative 'app/collections/album_collection'
#require_relative 'app/controllers/album_controller'

set :views, Proc.new {File.join(root, 'app/views')}

get '/' do
  @album_collection = AlbumCollection.new('top_100_albums.txt')
  erb :index
end

