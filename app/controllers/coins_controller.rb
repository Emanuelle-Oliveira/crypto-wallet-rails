class CoinsController < ApplicationController

  layout "adm" # Seta um layout diferente do padrão (application)
 
  # Antes do show, edit, update e destroy executa o set_coin
  before_action :set_coin, only: %i[ show edit update destroy ]

  # GET /coins or /coins.json
  # carrega todas as moedas e chama a view index
  def index 
    @coins = Coin.all # variável @coins passada pra view 
  end

  # GET /coins/1 or /coins/1.json
  # antes carrega a moeda (before_action) e chama a view show
  def show 
  end

  # GET /coins/new
  def new
    @coin = Coin.new
  end

  # GET /coins/1/edit
  def edit
  end

  # POST /coins or /coins.json
  def create
    @coin = Coin.new(coin_params)

    respond_to do |format|
      if @coin.save
        format.html { redirect_to coin_url(@coin), notice: "Coin was successfully created." }
        format.json { render :show, status: :created, location: @coin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coins/1 or /coins/1.json
  def update
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to coin_url(@coin), notice: "Coin was successfully updated." }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coins/1 or /coins/1.json
  # antes carrega a moeda (before_action), deleta essa moeda
  def destroy
    @coin.destroy

    # responde de acordo com o formato
    respond_to do |format|
      format.html { redirect_to coins_url, notice: "Coin was successfully destroyed." } # redireciona pra index e manda mensagem
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id]) # passa para as views a moeda encontrada através do id (param vindo da url)
    end

    # Only allow a list of trusted parameters through.
    def coin_params
      params.require(:coin).permit(:description, :acronym, :url_image)
    end
end
