Dado("preencho o campo usuario com {string}") do |usuario|                      
    @login = LoginPage.new
    @login.informar_usuario(usuario)
  end                                                                            
                                                                                 
  Quando("preencho o campo senha com {string}") do |senha|                      
    @login.informar_senha(senha)
  end                                                                            
                                                                                 
  Quando("clico no botao para logar") do                                         
    @login.clicar_botao_entre
  end                                                                            
                                                                                 
  Entao("vejo a página inicial do sistema") do                                   
    @login.validar_pagina_inicial
  end                                                                            