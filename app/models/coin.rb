class Coin < ApplicationRecord
    belongs_to :mining_type # relacionamento para o model - singular
end
