class Coin < ApplicationRecord
    # relacionamento para o model - singular
    belongs_to :mining_type #, optional: true
end
