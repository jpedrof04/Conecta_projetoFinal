class AddBotoesToConteudos < ActiveRecord::Migration[8.1]
  def change
    add_column :conteudos, :botao_texto, :string
    add_column :conteudos, :botao_link, :string
  end
end
