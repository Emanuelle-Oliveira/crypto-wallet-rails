class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :description
      t.string :acronym
      t.string :url_image

      t.timestamps
    end
  end
end

# Gera automaticamente:
# Campo id auto increment
# Campo created_at timestamp
# Campo updated_at timestamp

# ActiveRecord -> framework que implementa o padrão Active Record
# ORM
# Dados
# Model - BD

# Executar migrations -> Rails tasks
# rails db:create
# rails db:drop
# rails db:migrate
# rails db:rollback
