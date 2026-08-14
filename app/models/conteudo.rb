class Conteudo < ApplicationRecord
  has_one_attached :imagem
  has_many_attached :imagens

  SECOES = {
    "hero" => "Hero (capa)",
    "strip" => "Fita / marquee",
    "quem_somos" => "Quem Somos",
    "sobre" => "Sobre o Programa",
    "depoimentos" => "Depoimentos (trilha)",
    "aprender" => "O que você vai aprender",
    "projetos" => "Projetos (cabeçalho)",
    "turmas" => "Turmas",
    "galeria" => "Galeria / Carrossel",
    "equipe" => "Equipe",
    "participar" => "Como Participar",
    "cta" => "CTA / Inscrição",
    "footer" => "Rodapé",
  }.freeze

  scope :da_secao, ->(secao) { where(secao: secao).order(:posicao, :id) }
  scope :active, -> { where(ativo: true) }
  scope :ordem, -> { order(:secao, :posicao, :id) }
end
