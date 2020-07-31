Dado("que acesso o sistema com o usuario {string} e senha {string}") do |usuario, senha|
    @funcionario = ManterFuncionario.new
    @login = LoginPage.new
    @login.informar_usuario(usuario)
    @login.informar_senha(senha)
    @login.clicar_botao_entre
  end
  
  Quando("clico em novo funcionario") do
    @funcionario.acessar_novo_funcionario
  end
  
  Quando("preencho o campo NOME com {string}") do |nome|
    @funcionario.preencher_nome(nome)
  end
  
  Quando("preencho o campo CPF com {string}") do |cpf|
    @funcionario.preencher_cpf_invalido(cpf)
  end
  
  Quando("seleciono o SEXO com {string}") do |sexo|
    @funcionario.selecionar_sexo(sexo)
  end
  
  Quando("preencho o campo ADMISSAO com {string}") do |admissao|
    @funcionario.preencher_admissao(admissao)
  end
  
  Quando("preencho o campo CARGO com {string}") do |cargo|
    @funcionario.preencher_cargo(cargo)
  end
  
  Quando("preencho o campo SALARIO com {string}") do |salario|
    @funcionario.preencher_salario(salario)
  end
  
  Quando("seleciono o TIPO DE CONTRATACAO com {string}") do |contratacao|
    @funcionario.selecionar_tipo_contratacao(contratacao)
  end
  
  Quando("clico em enviar") do
    @funcionario.clicar_botao_enviar
  end
  
  Entao("vejo a mensagem de {string} no campo {string}") do |msg, campo|
    @funcionario.validar_campos(msg, campo)
  end
  
  Entao("vejo o alerta de CPF invalido") do
    @funcionario.validar_alerta_cpf_invalido
  end
  
  Quando("preencho o NOME com {string}") do |nome|
    @funcionario.preencher_nome_e_guardar(nome)
  end
  
  Quando("preencho o CPF com valor valido") do
    @funcionario.preencher_cpf_e_guardar
  end
  
  Quando("preencho o ADMISSAO com {string}") do |admissao|
    @funcionario.preencher_admissao_e_guardar(admissao)
  end
  
  Quando("preencho o CARGO com {string}") do |cargo|
    @funcionario.preencher_cargo_e_guardar(cargo)
  end
  
  Entao("vejo a mensagem de sucesso e o funcionario listado") do
    @funcionario.validar_funcionario_cadastrado
  end

  Quando("pesquiso pelo funcionario {string}") do |funcionario|
    @funcionario.pesquisar_funcionario(funcionario)
  end
  
  Quando("clico em editar no funcionario") do 
    @funcionario.clicar_editar_funcionario
  end
  
  Quando("preencho o campo CPF com valor valido") do
    @funcionario.preencher_cpf_e_guardar
  end
  
  Entao("vejo o funcionario editado listado") do
    @funcionario.validar_funcionario_editado
  end
  
  Quando("clico em excluir no funcionario {string}") do |func|
    @funcionario.clicar_excluir_funcionario(func)
  end
  
  Entao("vejo mensagem de sucesso e valido a exclusao do funcionario") do
    @funcionario.validar_funcionario_excluido
  end