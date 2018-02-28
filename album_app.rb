require 'erb'
require 'sinatra'
require_relative 'app/collections/album_collection'

set :views, Proc.new {File.join(root, 'app/views')}

get '/albums' do
  # set some helper variables for the query params
  @highlighted_index = (params.has_key?('highlighted_index') ? params[:highlighted_index] : nil).to_i
  @sorted_by = (params.has_key?('sort_by') ? params[:sort_by] : nil)

  @album_collection = AlbumCollection.new('top_100_albums.txt')
  @album_collection.sort_by_key(@sorted_by)

  # set the table headers
  @table_headers = [
    { sort_key: 'rank', name: '#' },
    { sort_key: 'title', name: 'Title' },
    { sort_key: 'year', name: 'Year' },
  ]

  erb :index
end