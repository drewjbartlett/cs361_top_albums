require 'sinatra'
require_relative 'app/collections/album_collection'
require 'erb'


set :views, Proc.new {File.join(root, 'app/views')}

get '/' do
  @album_collection = AlbumCollection.new('top_100_albums.txt')
  erb :index
end

get '/rank' do
  @album_collection = AlbumCollection.new('top_100_albums.txt')
  erb :index
end

get '/title' do
  @album_collection = AlbumCollection.new('top_100_albums.txt')
  erb :index
end

get '/year' do
  @album_collection = AlbumCollection.new('top_100_albums.txt')
  erb :index
end

post '/highlight' do
  @album_collection = AlbumCollection.new('top_100_albums.txt')
  erb :index
end