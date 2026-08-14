class CreateProjetos < ActiveRecord::Migration[8.1]
  def change
    create_table :projetos do |t|
      t.string :titulo
      t.text :descricao
      t.boolean :ativo

      t.timestamps
    end
  end
end
