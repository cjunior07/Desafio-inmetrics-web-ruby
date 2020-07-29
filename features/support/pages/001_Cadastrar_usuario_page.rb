class CadastrarUsuario < PageHelper

    element :btnCadastre, :xpath, "//ul[@class='navbar-nav ml-auto']/li[1]"
    element :inputUsuarioCadastro, :xpath, "//input[@name='username']"
    element :inputSenha, :xpath, "//input[@name='pass']"
    element :inputConfirmarSenha, :xpath, "//input[@name='confirmpass']"
    element :btnCadastrar, :xpath, "//button[@class='login100-form-btn']"
    element :alertValidateUsuario, :xpath, '//*[contains(@class, "alert-validate")]//input[@name="username"]'
    element :alertValidateSenha, :xpath, '//*[contains(@class, "alert-validate")]//input[@name="pass"]'
    element :alertValidateConfirmarSenha, :xpath, '//*[contains(@class, "alert-validate")]//input[@name="confirmpass"]'


    def clicar_botao_cadastre
        puts "Clicando botao cadastre"
        btnCadastre.click
    end

    def informar_usuario_cadastro
        puts "Informando usuario"
        @user_name = "#{Faker::Internet.email}"
        inputUsuarioCadastro.set(@user_name)
    end

    def informar_e_gravar_usuario
        puts "Informando usuario"
        @user_name = "#{Faker::Internet.email}"
        gravar_nome("features/massa/user_name.txt", @user_name)
        inputUsuarioCadastro.set(@user_name)
    end

    def informar_usuario_gravado
        puts "Informando usuário"
        @usuario = recuperar_nome("features/massa/user_name.txt")
        inputUsuarioCadastro.set(@usuario)
    end

    def informar_senha_cadastro(senha)
        puts "Preenchendo senha"
        inputSenha.set(senha)
    end

    def informar_confirma_senha(confirma_senha)
        puts "Preenchendo confirmar senha"
        inputConfirmarSenha.set(confirma_senha)
    end

    def clicar_botao_cadastrar
        puts "Clicando no botao cadastrar"
        btnCadastrar.click
    end

    def validar_alerta_campo_usuario
        puts "Validando teste"
        expect(page.has_xpath?('//*[contains(@class, "alert-validate")]//input[@name="username"]')).to eq true
    end

    def validar_alerta_campo_senha
        puts "Validando teste"
        expect(page.has_xpath?('//*[contains(@class, "alert-validate")]//input[@name="pass"]')).to eq true
        
    end

    def validar_alerta_campo_confirmar_senha
        puts "Validando teste"
        expect(page.has_xpath?('//*[contains(@class, "alert-validate")]//input[@name="confirmpass"]')).to eq true
        
    end

end