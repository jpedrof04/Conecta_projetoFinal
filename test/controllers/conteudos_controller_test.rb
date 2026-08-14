require "test_helper"

class ConteudosControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as users(:one)
    @conteudo = conteudos(:one)
  end

  test "should get index" do
    get conteudos_url
    assert_response :success
  end

  test "should get new" do
    get new_conteudo_url
    assert_response :success
  end

  test "should create conteudo" do
    assert_difference("Conteudo.count") do
      post conteudos_url, params: { conteudo: { secao: "hero", titulo: "Novo título", ativo: true } }
    end
    assert_redirected_to edit_conteudo_path(Conteudo.last)
  end

  test "should update conteudo" do
    patch conteudo_url(@conteudo), params: { conteudo: { titulo: "Título editado" } }
    assert_redirected_to edit_conteudo_url(@conteudo)
    assert_equal "Título editado", @conteudo.reload.titulo
  end

  test "should destroy conteudo" do
    assert_difference("Conteudo.count", -1) do
      delete conteudo_url(@conteudo)
    end
    assert_redirected_to conteudos_url
  end
end
