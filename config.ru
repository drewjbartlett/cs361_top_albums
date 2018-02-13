require_relative 'app/utils/router'
require_relative 'album_app'

router = Router.new

router.register('/albums', 'AlbumController@index')

run AlbumApp.new(router)
