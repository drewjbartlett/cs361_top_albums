require 'sinatra'
require_relative 'app/collections/album_collection'
#require_relative 'app/controllers/album_controller'
require 'erb'


set :views, Proc.new {File.join(root, 'app/views')}

get '/' do
  @album_collection = AlbumCollection.new('top_100_albums.txt')
  #@album_collection.sort_data_by_key(@request.params['sort_by'], @albums)
  erb :index
end

get '/rank' do
  @album_collection = AlbumCollection.new('top_100_albums.txt')
  #@albums = album_collection.sort_data_by_key(@request.params['sort_by'], @albums)
  erb :index
end

get '/title' do
  @album_collection = AlbumCollection.new('top_100_albums.txt')
 # @albums = album_collection.sort_data_by_key(@request.params['sort_by'], @albums)
  erb :index
end

get '/year' do
  @album_collection = AlbumCollection.new('top_100_albums.txt')
 # @albums = album_collection.sort_data_by_key(@request.params['sort_by'], @albums)
  erb :index
end

post '/highlight' do
  @album_collection = AlbumCollection.new('top_100_albums.txt')
  #@albums = album_collection.sort_data_by_key(@request.params['sort_by'], @albums)
  erb :index
end