# Arquivo onde ficam as configurações iniciais das tabelas do BD

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Caso tenha erro, mostra no prompt !

=begin
Coin.create!(
  [
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
    }
  ]
)
=end


spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas")
spinner.auto_spin

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
  }
]

# Procura, e só cria se não existir
coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

spinner.success("(Moedas cadastradas com sucesso!)")                                                                    