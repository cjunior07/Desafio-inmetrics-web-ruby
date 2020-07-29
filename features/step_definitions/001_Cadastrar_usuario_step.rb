Dado("que acesso a funcionalidade Cadastre-se") do
  @cadastrar = CadastrarUsuario.new
  @cadastrar.clicar_botao_cadastre
  end
  
  Quando("nao preencho o campo usuario") do
    
  end
  
  Quando("preencho a senha a ser cadastrada com {string}") do |senha|
    @cadastrar.informar_senha_cadastro(senha)
  end
  
  Quando("preencho a confirmacao de senha a ser cadastrada com {string}") do |confirma_senha|
    @cadastrar.informar_confirma_senha(confirma_senha)
  end
  
  Quando("clico em cadastrar") do
    @cadastrar.clicar_botao_cadastrar
  end
  
  Entao("vejo o alert no campo do usuario") do
    @cadastrar = CadastrarUsuario.new
    @cadastrar.validar_alerta_campo_usuario
  end
  
  Quando("preencho o campo usuario com usuario Fake") do
    @cadastrar.informar_usuario_cadastro
  end
  
  Entao("vejo o alert no campo Senha") do
    @cadastrar = CadastrarUsuario.new
    @cadastrar.validar_alerta_campo_senha
  end
  
  Entao("vejo o alert no campo Confirmar Senha") do
    @cadastrar.validar_alerta_campo_confirmar_senha
  end
  
  Entao("vejo a mensagem de {string}") do |texto|
    page.assert_text(texto)
  end
  
  Quando("preencho o campo usuario com usuario Fake valido") do
    @cadastrar.informar_e_gravar_usuario
  end
  
  Entao("vejo a tela de login") do
    page.assert_text("Login")
  end
  
  Quando("preencho o campo usuario com usuario Fake cadastrado") do
    @cadastrar.informar_usuario_gravado
  end