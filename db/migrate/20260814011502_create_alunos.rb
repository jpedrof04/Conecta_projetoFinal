class CreateAlunos < ActiveRecord::Migration[8.1]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :turma
      t.text :depoimento
      t.string :email
      t.string :telefone
      t.boolean :ativo

      t.timestamps
    end
  end
end
