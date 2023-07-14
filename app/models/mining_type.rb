class MiningType < ApplicationRecord
    has_many :coins # relacionamento para o model - plural
end
