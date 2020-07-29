#language: pt
#enconding: UTF-8
@FT003_Manter_Funcionario @All
Funcionalidade: Manter Funcionario

  Contexto: 
    Dado que acesso o sistema com o usuario "Cjunior07" e senha "123456"

  @CE001_MF_Validar_Campo_Obrigatorio_Nome
  Cenario: Validar campo obrigatorio NOME
    Quando clico em novo funcionario
    E preencho o campo NOME com ""
    E preencho o campo CPF com "162.027.060-90"
    E seleciono o SEXO com "Masculino"
    E preencho o campo ADMISSAO com "12/12/2021"
    E preencho o campo CARGO com "Analista de Teste"
    E preencho o campo SALARIO com "12000"
    E seleciono o TIPO DE CONTRATACAO com "pj"
    Quando clico em enviar
    Entao vejo a mensagem de "Preencha este campo." no campo "Nome"

  @CE002_MF_Validar_Campo_Obrigatorio_CPF
  Cenario: Validar campo obrigatorio CPF
    Quando clico em novo funcionario
    E preencho o campo NOME com "Claudio Junior"
    E preencho o campo CPF com ""
    E seleciono o SEXO com "Masculino"
    E preencho o campo ADMISSAO com "12/12/2021"
    E preencho o campo CARGO com "Analista de Teste"
    E preencho o campo SALARIO com "12000"
    E seleciono o TIPO DE CONTRATACAO com "pj"
    Quando clico em enviar
    Entao vejo a mensagem de "Preencha este campo." no campo "CPF"

  @CE003_MF_Validar_Campo_Obrigatorio_SEXO
  Cenario: Validar campo obrigatorio SEXO
    Quando clico em novo funcionario
    E preencho o campo NOME com "Claudio Junior"
    E preencho o campo CPF com "162.027.060-90"
    E seleciono o SEXO com ""
    E preencho o campo ADMISSAO com "12/12/2021"
    E preencho o campo CARGO com "Analista de Teste"
    E preencho o campo SALARIO com "12000"
    E seleciono o TIPO DE CONTRATACAO com "pj"
    Quando clico em enviar
    Entao vejo a mensagem de "Selecione um item da lista." no campo "Sexo"

  @CE004_MF_Validar_Campo_Obrigatorio_ADMISSAO
  Cenario: Validar campo obrigatorio ADMISSAO
    Quando clico em novo funcionario
    E preencho o campo NOME com "Claudio Junior"
   E preencho o campo CPF com "162.027.060-90"
    E seleciono o SEXO com "Masculino"
    E preencho o campo ADMISSAO com ""
    E preencho o campo CARGO com "Analista de Teste"
    E preencho o campo SALARIO com "12000"
    E seleciono o TIPO DE CONTRATACAO com "pj"
    Quando clico em enviar
    Entao vejo a mensagem de "Preencha este campo." no campo "Admissao"

  @CE005_MF_Validar_Campo_Obrigatorio_CARGO
  Cenario: Validar campo obrigatorio CARGO
    Quando clico em novo funcionario
    E preencho o campo NOME com "Claudio Junior"
    E preencho o campo CPF com "162.027.060-90"
    E seleciono o SEXO com "Masculino"
    E preencho o campo ADMISSAO com "12/12/2021"
    E preencho o campo CARGO com ""
    E preencho o campo SALARIO com "12000"
    E seleciono o TIPO DE CONTRATACAO com "pj"
    Quando clico em enviar
    Entao vejo a mensagem de "Preencha este campo." no campo "Cargo"

  @CE006_MF_Validar_Campo_Obrigatorio_SALARIO
  Cenario: Validar campo obrigatorio SALARIO
    Quando clico em novo funcionario
    E preencho o campo NOME com "Claudio Junior"
    E preencho o campo CPF com "162.027.060-90"
    E seleciono o SEXO com "Masculino"
    E preencho o campo ADMISSAO com "12/12/2021"
    E preencho o campo CARGO com "Analista de Teste"
    E preencho o campo SALARIO com ""
    E seleciono o TIPO DE CONTRATACAO com "pj"
    Quando clico em enviar
    Entao vejo a mensagem de "Preencha este campo." no campo "Salario"

  @CE007_MF_Validar_Campo_Obrigatorio_CONTRATACAO
  Cenario: Validar campo obrigatorio CONTRATACAO
    Quando clico em novo funcionario
    E preencho o campo NOME com "Claudio Junior"
    E preencho o campo CPF com "162.027.060-90"
    E seleciono o SEXO com "Masculino"
    E preencho o campo ADMISSAO com "12/12/2021"
    E preencho o campo CARGO com "Analista de Teste"
    E preencho o campo SALARIO com "12000"
    E seleciono o TIPO DE CONTRATACAO com ""
    Quando clico em enviar
    Entao vejo a mensagem de "Selecione uma das opções." no campo "Contratacao"

  @CE008_MF_Validar_Campo_CPF_Invalido
  Cenario: Validar campo CPF Invalido
    Quando clico em novo funcionario
    E preencho o campo NOME com "Claudio Junior"
    E preencho o campo CPF com "00000000000"
    Quando clico em enviar
    Entao vejo o alerta de CPF invalido

  @CE009_MF_Cadastrar_Funcionario
  Cenario: Cadastrar Novo Funcionario
    Quando clico em novo funcionario
    E preencho o NOME com "Claudio Junior"
    E preencho o CPF com valor valido
    E seleciono o SEXO com "Masculino"
    E preencho o ADMISSAO com "12/12/2021"
    E preencho o CARGO com "Analista de Teste"
    E preencho o campo SALARIO com "1200000"
    E seleciono o TIPO DE CONTRATACAO com "CLT"
    Quando clico em enviar
    Entao vejo a mensagem de sucesso e o funcionario listado

  @CE010_MF_Editar_Funcionario_Cadastrado
  Cenario: Editar Funcionario Cadastrado
    Quando clico em editar no funcionario
    E preencho o NOME com "Claudio da Luz Andrade Junior"
    E preencho o campo CPF com valor valido
    E seleciono o SEXO com "Masculino"
    E preencho o ADMISSAO com "10/08/2020"
    E preencho o CARGO com "Software Test Engineer"
    E preencho o campo SALARIO com "1200000"
    E seleciono o TIPO DE CONTRATACAO com "CLT"
    Quando clico em enviar
    Entao vejo o funcionario editado listado

  @CE011_MF_Remover_Funcionario_Editado
  Cenario: Remover funcionario editado
    Quando clico em excluir no funcionario "Claudio da Luz Andrade Junior"
    Entao vejo mensagem de sucesso e valido a exclusao do funcionario
