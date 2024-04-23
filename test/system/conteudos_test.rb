require "application_system_test_case"

class ConteudosTest < ApplicationSystemTestCase
  setup do
    @conteudo = conteudos(:one)
  end

  test "visiting the index" do
    visit conteudos_url
    assert_selector "h1", text: "Conteudos"
  end

  test "should create conteudo" do
    visit conteudos_url
    click_on "New conteudo"

    fill_in "Contem", with: @conteudo.contem
    fill_in "Conteudo type", with: @conteudo.conteudo_type
    fill_in "Position", with: @conteudo.position
    fill_in "Post", with: @conteudo.post_id
    click_on "Create Conteudo"

    assert_text "Conteudo was successfully created"
    click_on "Back"
  end

  test "should update Conteudo" do
    visit conteudo_url(@conteudo)
    click_on "Edit this conteudo", match: :first

    fill_in "Contem", with: @conteudo.contem
    fill_in "Conteudo type", with: @conteudo.conteudo_type
    fill_in "Position", with: @conteudo.position
    fill_in "Post", with: @conteudo.post_id
    click_on "Update Conteudo"

    assert_text "Conteudo was successfully updated"
    click_on "Back"
  end

  test "should destroy Conteudo" do
    visit conteudo_url(@conteudo)
    click_on "Destroy this conteudo", match: :first

    assert_text "Conteudo was successfully destroyed"
  end
end
