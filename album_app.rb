class AlbumApp

  def initialize(router)
    @router = router
  end

  def call(env)
    @router.dispatch(env)
  end

end