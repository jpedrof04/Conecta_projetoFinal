class Projeto < ApplicationRecord
  has_one_attached :capa
  has_many_attached :imagens
end
