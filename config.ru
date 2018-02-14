require_relative 'app/utils/router'
require_relative 'album_app'

router = Router.new
router.register('/albums', 'Album@index')

run AlbumApp.new(router)
