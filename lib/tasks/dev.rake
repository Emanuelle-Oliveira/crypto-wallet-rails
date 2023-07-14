namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD") { %x(rails db:drop) } 
      show_spinner("Criando BD") { %x(rails db:create) }
      show_spinner("Migrando BD") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "Você não está em ambiente de desenvolvimento"  
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do

    show_spinner("Cadastrando moedas") do
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://logodownload.org/wp-content/uploads/2017/06/bitcoin-logo-1-1.png"
        },
        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://logos-world.net/wp-content/uploads/2020/12/Ethereum-Symbol.png"
        },
        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://www.pngall.com/wp-content/uploads/10/Dash-Crypto-Logo-PNG-Cutout.png"
        },
        {
          description: "Iota",
          acronym: "IOT",
          url_image: "https://cryptologos.cc/logos/iota-miota-logo.png"
        },
        {
          description: "ZCash",
          acronym: "ZEC",
          url_image: "https://cryptologos.cc/logos/zcash-zec-logo.png"
        }
      ]

      # Procura, e só cria se não existir
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end   
    end   
  end 

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do

    show_spinner("Cadastrando tipos de mineração") do
      mining_types = [
        { description: "Proof of Work", acronym: "PoW" },
        { description: "Proof of Stake", acronym: "PoS" },
        { description: "Proof of Capacity", acronym: "PoC" }
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end  
    end
  end

  private
  def show_spinner(msg_start, msg_end = "Concluído com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield # bloco de código
    spinner.success("(#{msg_end})")
  end
end

# %x() executa instrução do terminal linux