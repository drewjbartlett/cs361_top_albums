class AlbumApp

  def initialize(router)
    @router = router
  end

  def call(env)
    @router.dispatch(Rack::Request.new(env))
  end

end