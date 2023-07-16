class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso Ruby on Rails - cookie" # guarda no navegador
    session[:curso] = "Curso Ruby on Rails - session" # guarda no servidor

    @nome = params[:nome] # query params -> url /?nome=Manu -> hash {"nome"=>"Manu"} GET
    @teste = params[:teste] # query params -> url /?nome=Manu&teste=ok -> hash {"nome"=>"Emanuelle", "teste"=>"ok"} GET
    @curso = "Rails" 
  end
end
