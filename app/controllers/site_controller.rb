class SiteController < ApplicationController
  allow_unauthenticated_access
  layout "site"

  def home
    @hero = Conteudo.da_secao("hero").first
    @strip = Conteudo.da_secao("strip").active
    @quem_somos = Conteudo.da_secao("quem_somos").active
    @sobre = Conteudo.da_secao("sobre").active
    @depoimentos = Conteudo.da_secao("depoimentos").active
    @aprender = Conteudo.da_secao("aprender").active
    @projetos_head = Conteudo.da_secao("projetos").active.first
    @turmas_head = Conteudo.da_secao("turmas").active.first
    @turmas = Conteudo.da_secao("turmas").active.where(posicao: 1..99)
    @galeria_head = Conteudo.da_secao("galeria").active.first
    @galeria = Conteudo.da_secao("galeria").active.where(posicao: 1..99)
    @equipe_head = Conteudo.da_secao("equipe").active.first
    @equipe = Conteudo.da_secao("equipe").active.where(posicao: 1..99)
    @participar = Conteudo.da_secao("participar").active.first
    @participar_fotos = Conteudo.da_secao("participar").active.drop(1)
    @cta = Conteudo.da_secao("cta").active
    @footer = Conteudo.da_secao("footer").active.first
    @projetos = Projeto.where(ativo: true).order(:id)
  end
end
