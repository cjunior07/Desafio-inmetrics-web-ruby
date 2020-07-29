#language: pt
#enconding: UTF-8

@FT002_Login @All 
Funcionalidade: Login

  @CE001_Login_Validar_Campo_Usuario 
  Cenario: Validar campo obrigatorio Usuario
    Dado preencho o campo usuario com ""
    Quando preencho o campo senha com "123456"
    E clico no botao para logar
    Entao vejo o alert no campo do usuario

  @CE002_Login_Validar_Campo_Senha 
  Cenario: Validar campo obrigatorio Senha
    Dado preencho o campo usuario com "Cjunior07"
    Quando preencho o campo senha com ""
    E clico no botao para logar
    Entao vejo o alert no campo Senha

  @CE003_Login_Validar_Usuario_Invalido 
  Cenario: Validar usuario invalido
    Dado preencho o campo usuario com "!@#$%123456"
    Quando preencho o campo senha com "123456"
    E clico no botao para logar
    Entao vejo a mensagem de "Usuário ou Senha inválidos"

  @CE004_Login_Validar_Senha_Invalida 
  Cenario: Validar Senha invalida
    Dado preencho o campo usuario com "Cjunior07"
    Quando preencho o campo senha com "987654"
    E clico no botao para logar
    Entao vejo a mensagem de "Usuário ou Senha inválidos"

  @CE005_Login_Validar_Senha_Invalida 
  Cenario: Realizar Login com sucesso
    Dado preencho o campo usuario com "Cjunior07"
    Quando preencho o campo senha com "123456"
    E clico no botao para logar
    Entao vejo a página inicial do sistema
