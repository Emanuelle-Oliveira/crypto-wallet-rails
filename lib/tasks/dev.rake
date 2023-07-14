namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?

      # outra opção
      show_spinner("Apagando BD") { %x(rails db:drop) } 

      show_spinner("Criando BD") do 
        %x(rails db:create)
      end

      show_spinner("Migrando BD") do 
        %x(rails db:migrate) 
      end

      show_spinner("Populando BD") do
        %x(rails db:seed)
      end
    else
      puts "Você não está em ambiente de desenvolvimento"  
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