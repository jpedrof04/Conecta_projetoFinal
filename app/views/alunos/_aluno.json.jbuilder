json.extract! aluno, :id, :nome, :turma, :depoimento, :email, :telefone, :ativo, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
