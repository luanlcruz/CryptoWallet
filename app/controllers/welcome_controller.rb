class WelcomeController < ApplicationController
  def index
  	cookies[:curso] = "Curso de Ruby on Rails - Ft.Jackson"
  	@nome =  params[:nome]
  	@curso = params[:curso]
  end
end
