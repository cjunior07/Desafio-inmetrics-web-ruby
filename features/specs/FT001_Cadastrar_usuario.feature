#language: pt
#enconding: UTF-8

@FT001_Cadastrar_Usuario @All
Funcionalidade: Cadastrar Usuario

  Contexto: 
    Dado que acesso a funcionalidade Cadastre-se

  @CE001_CU_Validar_Campo_Usuario
  Cenario: Validar campo obrigatorio Usuario
    Quando nao preencho o campo usuario
    E preencho a senha a ser cadastrada com "123456"
    E preencho a confirmacao de senha a ser cadastrada com "123456"
    E clico em cadastrar
    Entao vejo o alert no campo do usuario

  @CE002_CU_Validar_Campo_Senha
  Cenario: Validar campo obrigatorio Senha
    Quando preencho o campo usuario com usuario Fake
    E preencho a senha a ser cadastrada com ""
    E preencho a confirmacao de senha a ser cadastrada com "123456"
    E clico em cadastrar
    Entao vejo o alert no campo Senha

  @CE003_CU_Validar_Campo_Confirmar_Senha
  Cenario: Validar campo obrigatorio Confirmar Senha
    Quando preencho o campo usuario com usuario Fake
    E preencho a senha a ser cadastrada com "123456"
    E preencho a confirmacao de senha a ser cadastrada com ""
    E clico em cadastrar
    Entao vejo o alert no campo Confirmar Senha

  @CE004_CU_Validar_Senhas_Diferentes
  Cenario: Validar confirmacao de senhas diferentes
    Quando preencho o campo usuario com usuario Fake
    E preencho a senha a ser cadastrada com "123456"
    E preencho a confirmacao de senha a ser cadastrada com "654321"
    E clico em cadastrar
    Entao vejo a mensagem de "Senhas não combinam"

  @CE005_CU_Cadastrar_Usuario_Sucesso
  Cenario: Cadastrar usuario com sucesso
    Quando preencho o campo usuario com usuario Fake valido
    E preencho a senha a ser cadastrada com "123456"
    E preencho a confirmacao de senha a ser cadastrada com "123456"
    E clico em cadastrar
    Entao vejo a tela de login

  @CE006_CU_Validar_Usuario_Cadastrado
  Cenario: Validar usuario ja cadastrado
    Quando preencho o campo usuario com usuario Fake cadastrado
    E preencho a senha a ser cadastrada com "123456"
    E preencho a confirmacao de senha a ser cadastrada com "123456"
    E clico em cadastrar
    Entao vejo a mensagem de "Usuário já cadastrado"
