module ApplicationHelper
    def date_br(date_us)
        date_us.strftime("%d/%m/%Y")
    end

    def app_name
        "CRYPTO WALLET APP"
    end

    def rails_env
        if Rails.env.development?
            "Desenvolvimento"            
        elsif Rails.env.production?
            "Produção"
        else
            "Teste"
        end
    end
end
