class LoginPage < SitePrism::Page
  
  element :inputUsuario, :xpath, "//input[@name='username']"
  element :inputSenha, :xpath, "//input[@name='pass']"
  element :btnEntre, :xpath, "//*[text()[contains(.,'Entre')]]"
  element :tabela, "#tabela"

  def informar_usuario(usuario)
    puts "Informando usuario"
    inputUsuario.set(usuario)
  end

  def informar_senha(senha)
    puts "Informando senha"
    inputSenha.set(senha)
  end

  def clicar_botao_entre
    puts "Clicando botão entre"
    btnEntre.click
  end

  def validar_pagina_inicial
    puts "Validanto teste"
    expect(page.has_css?('#tabela')).to eq true
  end


end