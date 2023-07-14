# rails g migration AddMiningTypeToCoins mining_type:references
# Nome da chave estrangeira precisa ser igual ao nome da tabela no singular
# Altera a tabela e não o model
# O nome da coluna fica: mining_type_id

class AddMiningTypeToCoins < ActiveRecord::Migration[5.2]
  def change
    add_reference :coins, :mining_type, foreign_key: true
  end
end
