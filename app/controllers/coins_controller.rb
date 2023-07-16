class CoinsController < ApplicationController

  layout "adm" # Seta um layout diferente do padrão (application)
 
  # Antes do show, edit, update e destroy executa o set_coin
  before_action :set_coin, only: %i[ show edit update destroy ]

  before_action :set_mining_type_options, only: %i[ new create edit update ]

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
  # cria uma nova moeda, carrega mining_type_options (before_action) e chama a view new
  def new
    @coin = Coin.new
  end

  # GET /coins/1/edit
  # antes carrega a moeda e mining_type_options (before_action) e chama a view edit
  def edit
  end

  # POST /coins or /coins.json
  # cria uma nova moeda passando os parâmetros
  def create
    @coin = Coin.new(coin_params)

    # responde de acordo com o formato
    respond_to do |format|
      # salva
      if @coin.save 
        # redireciona pra show e manda mensagem
        format.html { redirect_to coin_url(@coin), notice: "Coin was successfully created." }
        format.json { render :show, status: :created, location: @coin }
      else
        # fica em new
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coins/1 or /coins/1.json
  # atualiza a moeda passando os parâmetros
  def update

    # responde de acordo com o formato
    respond_to do |format|
       # atualiza passando os parâmetros
      if @coin.update(coin_params)
        # redireciona pra show e manda mensagem
        format.html { redirect_to coin_url(@coin), notice: "Coin was successfully updated." } 
        format.json { render :show, status: :ok, location: @coin }
      else
         # fica em edit
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

  # métodos privados
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id]) # passa para as views a moeda encontrada através do id (param vindo da url)
    end

    # Only allow a list of trusted parameters through.
    # Pega os dados que viram no post
    def coin_params
      params.require(:coin).permit(:description, :acronym, :url_image, :mining_type_id)
    end

    def set_mining_type_options
      @mining_type_options = MiningType.all.pluck(:description, :id)
    end
end
