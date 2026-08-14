class CreateProfessors < ActiveRecord::Migration[8.1]
  def change
    create_table :professors do |t|
      t.string :nome
      t.string :materia
      t.text :bio
      t.boolean :ativo

      t.timestamps
    end
  end
end
