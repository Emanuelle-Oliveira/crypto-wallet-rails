class WelcomeController < ApplicationController
  def index
    @nome = params[:nome] # query params -> url /?nome=Manu -> hash {"nome"=>"Manu"} GET
    @teste = params[:teste] # query params -> url /?nome=Manu&teste=ok -> hash {"nome"=>"Emanuelle", "teste"=>"ok"} GET
    @curso = "Rails" 
  end
end
