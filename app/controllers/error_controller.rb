require_relative 'base_controller'

class ErrorController < BaseController
  def index()
    self.render('error', 404)
  end
end