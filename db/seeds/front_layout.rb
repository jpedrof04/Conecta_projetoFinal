# Layout padrão do front-end do site (Barracred Conecta)
#
# Este arquivo "grava" a estrutura de conteúdo do index.html original.
# Cada seção vira registros do modelo Conteudo (secao + titulo + texto + imagem).
# As fotos já existentes em nova-v2/assets/images são anexadas como padrão.
#
# É idempotente: pode rodar quantas vezes quiser (bin/rails db:seed).

IMG_ROOT = Rails.root.join("..", "nova-v2", "assets", "images")

def img_arquivo(relativa)
  path = IMG_ROOT.join(relativa)
  return nil unless File.exist?(path)
  { io: File.open(path), filename: File.basename(path), content_type: "image/#{File.extname(path).delete('.').downcase}" }
end

def grava_conteudo(secao, posicao, titulo: nil, subtitulo: nil, texto: nil, imagem: nil, botao_texto: nil, botao_link: nil)
  item = Conteudo.find_or_initialize_by(secao: secao, posicao: posicao)
  item.titulo = titulo
  item.subtitulo = subtitulo
  item.texto = texto
  item.botao_texto = botao_texto
  item.botao_link = botao_link
  item.ativo = true
  item.save!

  if imagem && item.imagem.blank?
    arquivo = img_arquivo(imagem)
    item.imagem.attach(arquivo) if arquivo
  end
  item
end

puts "Gravando layout padrão do front-end..."

# ---------- HERO ----------
grava_conteudo "hero", 0,
  titulo: "Barracred Conecta",
  subtitulo: "Criando Oportunidades e Cooperando para o Futuro"

# ---------- STRIP (marquee) ----------
["Tecnologia da Informação", "Inglês Técnico", "Educação Financeira",
 "Habilidades Pessoais", "Cooperativismo na Prática", "Estágios"].each_with_index do |item, i|
  grava_conteudo "strip", i, titulo: item
end

# ---------- QUEM SOMOS ----------
grava_conteudo "quem_somos", 0,
  titulo: "Seja bem-vindo ao Barracred Conecta",
  texto: "Aqui, acreditamos que cada jovem carrega um mundo de possibilidades. Foi por isso que criamos este espaço: para inspirar, capacitar e criar conexões com o futuro por meio da educação, do conhecimento e do desenvolvimento humano.\n\nSomos um Programa Social da Cooperativa Barracred, desenvolvido com carinho para abrir caminhos e oferecer oportunidades reais a jovens que desejam crescer como pessoas, desenvolver suas habilidades profissionais e assumir, com consciência, seu papel na sociedade.\n\nNosso compromisso vai muito além da capacitação técnica! Queremos estar presentes na jornada de autoconhecimento, fortalecimento emocional, preparação e inserção no mundo do trabalho de cada jovem, sempre fundamentados e guiados pelos valores cooperativistas."
grava_conteudo "quem_somos", 1,
  titulo: "Logo Barracred",
  imagem: "logo_barracred-removebg-preview.png"
grava_conteudo "quem_somos", 2,
  titulo: "Sede Barracred",
  imagem: "barracred frente.jpeg"
grava_conteudo "quem_somos", 3, titulo: "Foto 1", imagem: "quemsomos/1.jpg"
grava_conteudo "quem_somos", 4, titulo: "Foto 2", imagem: "quemsomos/2.jpeg"
grava_conteudo "quem_somos", 5, titulo: "Foto 3", imagem: "quemsomos/3.jpeg"

# ---------- SOBRE O PROGRAMA ----------
grava_conteudo "sobre", 0,
  titulo: "O que é o Barracred Conecta?",
  texto: "O Barracred Conecta é muito mais do que uma capacitação. É uma porta de entrada para um novo mundo. Um programa pensado para preparar jovens para os desafios de hoje e as oportunidades de amanhã, com uma formação que une técnica, propósito e valores.\n\nCom aulas de Tecnologia da Informação, Inglês Técnico, Educação Financeira e Desenvolvimento de Habilidades Pessoais e Profissionais, buscamos formar jovens confiantes, preparados e conscientes, capazes de atuar com protagonismo na vida e no trabalho.\n\nAlém da formação, oferecemos acompanhamento psicológico e apoio integral, cuidando também da saúde emocional dos alunos ao longo da jornada.\n\nE tudo isso é oferecido de forma totalmente gratuita, graças ao investimento da Cooperativa Barracred, que ainda garante aos participantes:\n• Material didático\n• Uniforme\n• Vale-transporte\n• Alimentação\n• Equipamentos individuais\n• Laboratório técnico equipado"
grava_conteudo "sobre", 1,
  titulo: "Momentos",
  imagem: "home/Imagem do WhatsApp de 2025-05-01 à(s) 08.56.09_7da9d661.jpg.jpeg"
grava_conteudo "sobre", 2,
  titulo: "Atividades",
  imagem: "home/IMG_0208.JPG.jpeg"

# ---------- DEPOIMENTOS (flip cards da trilha) ----------
grava_conteudo "depoimentos", 0,
  titulo: "Samuel Mota", subtitulo: "Turma 1",
  texto: "Participar da primeira turma do Conecta foi uma experiência incrível, o curso contribuiu para meu desenvolvimento pessoal e profissional, conhecimento em TI e inglês técnico.",
  imagem: "depoimentoalunos/samuel.turma4.jpeg"
grava_conteudo "depoimentos", 1,
  titulo: "Gabriel Grizoni", subtitulo: "Turma 2",
  texto: "O Conecta foi muito mais do que um curso, foi onde encontrei um propósito e dei inicio a minha carreira. Até hoje, acompanho as novas turmas. O Conecta se tornou parte da minha história.",
  imagem: "depoimentoalunos/gabriel.turma2.png"
grava_conteudo "depoimentos", 2,
  titulo: "Marcela da Silva", subtitulo: "Turma 3",
  texto: "Participar da turma III do Conecta foi uma experiência muito especial de aprendizado e crescimento, que me proporcionou uma oportunidade de trabalho.",
  imagem: "depoimentoalunos/marcela.turma3.jpeg"
grava_conteudo "depoimentos", 3,
  titulo: "Stefani Mota", subtitulo: "Turma 4",
  texto: "Participar da turma IV do Conecta marcou minha vida, com desafios e aprendizados que me fizeram crescer profissional e pessoalmente. Sou muito grata por tudo que vivi neste curso.",
  imagem: "depoimentoalunos/stefani.turma4.jpeg"

# ---------- O QUE VOCÊ VAI APRENDER ----------
grava_conteudo "aprender", 0,
  titulo: "Habilidades Pessoais e Profissionais",
  texto: "Desenvolvemos jovens para o mercado de trabalho por meio de habilidades socioemocionais e profissionais.",
  imagem: "Habilidades Pessoais e Profissionais.png"
grava_conteudo "aprender", 1,
  titulo: "Tecnologia da Informação",
  texto: "Formamos profissionais de TI com conhecimentos em sistemas, programação e banco de dados.",
  imagem: "Tecnologia da Informação.png"
grava_conteudo "aprender", 2,
  titulo: "Inglês Técnico",
  texto: "Desenvolvemos o inglês para o ambiente corporativo, com foco na comunicação profissional.",
  imagem: "Inglês Técnico.png"
grava_conteudo "aprender", 3,
  titulo: "Educação Financeira",
  texto: "Ensinamos educação financeira para desenvolver hábitos conscientes e planejamento.",
  imagem: "Educação Financeira.png"
grava_conteudo "aprender", 4,
  titulo: "Oficinas para o Mercado",
  texto: "Capacitamos os jovens para conquistar oportunidades no mercado profissional.",
  imagem: "Oficinas para o Mercado.png"
grava_conteudo "aprender", 5,
  titulo: "Cooperativismo na Prática",
  texto: "Apresentamos os princípios do cooperativismo e a importância da colaboração.",
  imagem: "Cooperativismo na Prática.jpeg"
grava_conteudo "aprender", 6,
  titulo: "Palestras Imersivas",
  texto: "Profissionais compartilham experiências para inspirar e desenvolver futuros talentos.",
  imagem: "Palestras Imersivas.png"
grava_conteudo "aprender", 7,
  titulo: "Feiras e Eventos",
  texto: "Promovemos vivências, networking e aprendizado para o desenvolvimento profissional.",
  imagem: "Feiras e Eventos.jpeg"
grava_conteudo "aprender", 8,
  titulo: "Estágios e Oportunidades",
  texto: "Facilitamos o ingresso no mercado de trabalho com oportunidades reais.",
  imagem: "Estágios e Oportunidades.png"

# ---------- PROJETOS (cabeçalho) ----------
grava_conteudo "projetos", 0,
  titulo: "Projetos que conectam aprendizado, comunidade e transformação",
  texto: "Além das aulas, os alunos vivenciam experiências práticas que ampliam a formação humana, fortalecem vínculos com a comunidade e transformam conhecimento em impacto social."

# ---------- TURMAS ----------
grava_conteudo "turmas", 0,
  titulo: "Nossas turmas",
  texto: "Turmas que já fizeram e fazem parte dessa trajetória de aprendizado, cooperação e transformação."
grava_conteudo "turmas", 1, titulo: "Turma 1", imagem: "classes/1.jpg"
grava_conteudo "turmas", 2, titulo: "Turma 2", imagem: "classes/2.jpg"
grava_conteudo "turmas", 3, titulo: "Turma 3", imagem: "classes/3.jpg"
grava_conteudo "turmas", 4, titulo: "Turma 4", imagem: "classes/4.jpeg"

# ---------- GALERIA / CARROSSEL ----------
grava_conteudo "galeria", 0,
  titulo: "Memórias do programa",
  texto: "Momentos que marcam a jornada dos nossos alunos dentro e fora da sala de aula."
%w[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16].each_with_index do |n, i|
  ext = { "1" => "jpg", "2" => "JPG", "3" => "jpg" }.fetch(n, "jpeg")
  grava_conteudo "galeria", i + 1, titulo: "Foto #{n}", imagem: "carrosselduplo/#{n}.#{ext}"
end

# ---------- EQUIPE ----------
grava_conteudo "equipe", 0,
  titulo: "Quem está com você nessa?",
  texto: "Construímos uma equipe sólida, capaz de oferecer aos jovens alunos do Programa, oportunidades para desenvolver suas habilidades e adquirir as competências necessárias ao mundo atual.\n\nNosso time é composto de profissionais especializados, capazes e dedicados formação de jovens, desde o básico comportamental até conceitos avançados de programação e tecnologia.\n\nEstamos aqui para apoiar, ensinar, escutar e caminhar junto com você - com respeito, acolhimento e entusiasmo.",
  imagem: "team/equipe.jpg"
[
  ["Andresa", "Coordenadora", "team/andresa.jpg"],
  ["Adilson", "Assistente de Coordenação", "team/adilson.jpg"],
  ["Prof. Aline", "Inglês Técnico", "team/aline.jpg"],
  ["Prof. Cristiane", "Hab. Pessoais e Profissionais", "team/cris.jpg"],
  ["Prof. Gallo", "Tecnologia da Informação", "team/gallo2.jpg"],
  ["Prof. Vera", "Hab. Pessoais e Profissionais", "team/vera.jpg"],
].each_with_index do |(nome, cargo, foto), i|
  grava_conteudo "equipe", i + 1, titulo: nome, subtitulo: cargo, imagem: foto
end

# ---------- COMO PARTICIPAR ----------
grava_conteudo "participar", 0,
  titulo: "Como participar?",
  texto: "O programa é destinado a jovens entre 16 e 20 anos que buscam mais do que conhecimento técnico: buscam uma experiência de transformação pessoal e profissional.\n\nDuração: 10 meses. Vagas atuais: 20.\n\n• 70% para filhos ou dependentes de cooperados da Barracred.\n• 30% para jovens da comunidade em geral.\n\nRequisitos:\n• Ter entre 16 e 20 anos.\n• Estar cursando ou ter concluído a educação básica na rede pública.\n• Residir em Barra Bonita ou Igaraçu do Tietê - SP.\n• Ter comprometimento e disponibilidade para participar integralmente da formação.",
  imagem: "home/ChatGPT Image 13 de ago. de 2026, 15_57_20.png"
grava_conteudo "participar", 1,
  titulo: "Foto participar 1", imagem: "home/Imagem do WhatsApp de 2025-05-01 à(s) 08.56.09_7da9d661.jpg.jpeg"
grava_conteudo "participar", 2,
  titulo: "Foto participar 2", imagem: "home/IMG_0208.JPG.jpeg"

# ---------- CTA / INSCRIÇÃO ----------
grava_conteudo "cta", 0,
  titulo: "Ficou interessado?",
  texto: "O processo de inscrição é simples! Basta clicar no botão abaixo e preencher o formulário rápido. As inscrições estarão abertas até 10 de agosto de 2026.\n\nApós essa fase, nossa equipe entrará em contato com todos os inscritos para dar continuidade ao processo de seleção.",
  subtitulo: "painel_inscricao",
  botao_texto: "Quero me inscrever",
  botao_link: "https://beforms.becompliance.com/680a40523c67010009167a96",
  imagem: "alunos.png"
grava_conteudo "cta", 1,
  titulo: "Seja um parceiro dessa transformação",
  texto: "Você é empresário, profissional ou representa uma empresa e quer investir em jovens talentos? O Barracred Conecta está sempre aberto a parcerias que acreditam na educação e no desenvolvimento social como motor de mudança.\n\nComo você pode contribuir: oferecendo oportunidades de estágio, compartilhando conhecimento através de palestras e mentorias, ou facilitando conexões com o mercado.",
  subtitulo: "painel_parceiro",
  botao_texto: "Fale conosco no WhatsApp",
  botao_link: "https://wa.me/5514996680366?text=Olá,%20quero%20ser%20um%20parceiro%20Barracred%20Conecta!!!",
  imagem: "parceiros.png"

# ---------- RODAPÉ ----------
grava_conteudo "footer", 0,
  titulo: "Nosso foco é transformar vidas por meio da educação e da tecnologia.",
  texto: "Criamos experiências e soluções que fazem sentido para os jovens e para a realidade em que vivem. Tudo o que oferecemos nasce do nosso compromisso com o futuro deles.\n\nEndereço: Rua Ferrucio Bolla, 613. Barra Bonita - SP\nTelefone: (14) 99668-0366\nE-mail: social@barracred.com.br"

# ---------- PROJETOS (cards com fotos) ----------
def anexa_em(record, relativa)
  arquivo = img_arquivo(relativa)
  return unless arquivo
  existe = record.imagens.attachments.any? { |a| a.blob.filename.to_s == arquivo[:filename] }
  record.imagens.attach(arquivo) unless existe
end

projeto1 = Projeto.find_or_create_by!(titulo: "Conectando Gerações") do |p|
  p.descricao = "Uma proposta socioeducativa que aproxima os alunos do Barracred Conecta dos idosos residentes em lares de amparo à velhice de Barra Bonita, promovendo convivência, acolhimento, troca de experiências e respeito entre diferentes gerações.\n\n• Inclusão social e troca de experiências.\n• Fortalecimento de vínculos, valores e cidadania.\n• Respeito intergeracional, diálogo e escuta ativa.\n• Valorização das histórias, culturas e vivências dos idosos."
  p.ativo = true
end
projeto1.capa.attach(img_arquivo("projects/conectando-geracoes/2.jpeg")) if projeto1.capa.blank?
%w[2 3 4 5].each { |n| anexa_em(projeto1, "projects/conectando-geracoes/#{n}.jpeg") }

projeto2 = Projeto.find_or_create_by!(titulo: "Conecta em Ação") do |p|
  p.descricao = "O projeto transforma o teatro em uma poderosa ferramenta de aprendizado, expressão, engajamento e impacto social. As peças são criadas e encenadas pelos próprios alunos, abordando temas relevantes de forma sensível e educativa.\n\n• Comunicação, expressão e criatividade.\n• Trabalho em equipe, cooperação e comprometimento.\n• Protagonismo juvenil e formação cidadã.\n• Educação Financeira de forma criativa e transformadora."
  p.ativo = true
end
[
  "projects/conecta-em-acao/WhatsApp Image 2026-08-13 at 14.36.51.jpeg",
  "projects/conecta-em-acao/2.jpeg",
  "projects/conecta-em-acao/3.jpeg",
  "projects/conecta-em-acao/5.jpeg",
  "projects/conecta-em-acao/WhatsApp Image 2026-08-12 at 14.04.11.jpeg",
  "projects/conecta-em-acao/WhatsApp Image 2026-08-12 at 14.04.32.jpeg",
].each { |a| anexa_em(projeto2, a) }
projeto2.capa.attach(projeto2.imagens.first.blob) if projeto2.capa.blank? && projeto2.imagens.attached?

puts "Layout padrão gravado: #{Conteudo.count} itens de conteúdo, #{Projeto.count} projetos."
