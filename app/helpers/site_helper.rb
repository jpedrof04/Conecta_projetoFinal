module SiteHelper
  def img_url(item)
    url_for(item.imagem) if item&.imagem&.attached?
  end

  def texto_paragrafos(texto, list_class: "modern-check-list")
    return "" if texto.blank?
    safe_join(texto.split(/\n{2,}/).map do |bloco|
      linhas = bloco.split("\n")
      if linhas.all? { |l| l.strip.start_with?("•", "*", "-") }
        content_tag(:ul, class: list_class) do
          safe_join(linhas.map { |l| content_tag(:li, l.sub(/\A[•*\-]\s*/, "")) })
        end
      else
        content_tag(:p, safe_join(linhas.map { |l| h(l) + tag.br }, ""))
      end
    end)
  end

  def split_descricao(descricao)
    partes = descricao.to_s.split(/\n{2,}/)
    lead = partes.shift
    bullets = partes.flat_map { |p| p.split("\n") }
                     .map { |l| l.sub(/\A[•*\-]\s*/, "") }
                     .reject(&:blank?)
    [lead, bullets]
  end

  def split_contato(texto)
    return {} if texto.blank?
    linhas = texto.split("\n").map(&:strip).reject(&:blank?)
    endereco = linhas.find { |l| l.start_with?("Endereço") }&.sub("Endereço:", "")&.strip
    telefone = linhas.find { |l| l.start_with?("Telefone") }&.sub("Telefone:", "")&.strip
    email = linhas.find { |l| l.start_with?("E-mail") || l.start_with?("Email") }&.sub(/\AE-?mail:\s*/, "")&.strip
    { endereco: endereco, telefone: telefone, email: email }
  end
end
