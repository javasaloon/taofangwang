class HomeController < ApplicationController
  def index
    @users = User.all
    @need = Need.new
  end
end
