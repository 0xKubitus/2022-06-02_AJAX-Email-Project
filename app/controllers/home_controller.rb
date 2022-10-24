class HomeController < ApplicationController
  def index
    @emails = Email.all
  end
end
