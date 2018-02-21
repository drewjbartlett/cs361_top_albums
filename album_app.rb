require 'sinatra'
require_relative 'app/collections/album_collection'

get '/albums' do
  album_collection = AlbumCollection.new('top_100_albums.txt')

  album_collection.items
end