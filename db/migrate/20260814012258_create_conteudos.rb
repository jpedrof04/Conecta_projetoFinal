class CreateConteudos < ActiveRecord::Migration[8.1]
  def change
    create_table :conteudos do |t|
      t.string :secao
      t.string :titulo
      t.string :subtitulo
      t.text :texto
      t.integer :posicao
      t.boolean :ativo

      t.timestamps
    end
  end
end
