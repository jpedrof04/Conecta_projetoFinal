class ConteudosController < ApplicationController
  before_action :set_conteudo, only: %i[ show edit update destroy ]

  def index
    @conteudos = Conteudo.ordem
    @por_secao = @conteudos.group_by(&:secao)
  end

  def show
  end

  def new
    @conteudo = Conteudo.new(secao: params[:secao])
  end

  def edit
  end

  def create
    @conteudo = Conteudo.new(conteudo_params)

    if @conteudo.save
      redirect_to edit_conteudo_path(@conteudo), notice: "Conteúdo criado. Adicione a imagem abaixo."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @conteudo.update(conteudo_params)
      redirect_to edit_conteudo_path(@conteudo), notice: "Conteúdo atualizado com sucesso."
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @conteudo.destroy!
    redirect_to conteudos_path, notice: "Conteúdo removido.", status: :see_other
  end

  private
    def set_conteudo
      @conteudo = Conteudo.find(params.expect(:id))
    end

    def conteudo_params
      params.expect(conteudo: [ :secao, :titulo, :subtitulo, :texto, :botao_texto, :botao_link, :posicao, :ativo, :imagem, imagens: [] ])
    end
end
