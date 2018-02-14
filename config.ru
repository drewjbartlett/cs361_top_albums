require_relative 'app/utils/router'
require_relative 'album_app'

router = Router.new
router.register('/albums', 'AlbumController@index')

map '/assets' do |env|
  # puts env
  puts 'vhar'
  puts File.expand_path(File.join('../app/assets'), __FILE__)
  run Rack::File.new(File.expand_path(File.join('../app/assets/styles.css'), __FILE__))
end

run AlbumApp.new(router)
