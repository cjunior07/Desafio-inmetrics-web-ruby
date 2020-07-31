class ManterFuncionario < PageHelper
    element :btnNovoFuncionario, :xpath, "//*[text()[contains(.,'Novo Funcionário')]]"
    element :btnEnviar, :xpath, "//*[contains(@class, \"cadastrar\")]"
    element :inputNome, "#inputNome"
    element :inputCPF, "#cpf"
    element :selectSexo, "#slctSexo"
    element :inputAdmissao, "#inputAdmissao"
    element :inputCargo, "#inputCargo"
    element :inputSalario, "#dinheiro"
    element :radioCLT, "#clt"
    element :radioPJ, "#pj"
    element :input_pesquisar, :xpath, "//input[@type='search']"

    def pesquisar_funcionario(funcionario)
        puts "Pesquisando funcionario"
        input_pesquisar.set(funcionario)
    end

    def acessar_novo_funcionario
        puts "Acessando novo funcionario"
        btnNovoFuncionario.click
    end

    def clicar_botao_enviar
        puts "Clicando botao enviar"
        btnEnviar.click
    end

    def preencher_cpf
        puts "Preenchendo CPF"
        @cpf = Faker::CPF
        inputCPF.set(@cpf)
    end

    def preencher_nome_e_guardar(nome)
        puts "Preenchendo NOME"
        inputNome.native.clear
        sleep(0.5)
        inputNome.set(nome)
        gravar_nome("features/massa/nome_funcionario.txt", nome)
    end

    def preencher_admissao_e_guardar(admissao)
        puts "Preenchendo ADMISSÃO"
        inputAdmissao.native.clear
        sleep(0.5)
        inputAdmissao.set(admissao)
        gravar_nome("features/massa/admissao_funcionario.txt", admissao)
    end

    def preencher_cargo_e_guardar(cargo)
        puts "Preenchdo CARGO"
        inputCargo.native.clear
        sleep(0.5)
        inputCargo.set(cargo)
        gravar_nome("features/massa/cargo_funcionario.txt", cargo)
    end

    def preencher_cpf_e_guardar
        puts "Preenchendo CPF"
        @cpf = Faker::CPF.pretty
        count = 0
            while inputCPF.value != "" && count < 20
                inputCPF.send_keys(:backspace)
                count += 1
            end
        sleep(2)
        inputCPF.send_keys(@cpf)
        gravar_nome("features/massa/cpf_funcionario.txt", @cpf)
    end

    def preencher_nome(nome)
        puts "Preenchendo NOME"
        inputNome.set(nome)
    end

    def preencher_cpf_invalido(cpf)
        puts "CPF Invalido"
        inputCPF.set(cpf)
    end

    def selecionar_sexo(sexo)
        puts "Selecionando SEXO"
        selectSexo.select(sexo)
    end

    def preencher_admissao(admissao)
        puts "Preenchendo ADMISSÃO"
        inputAdmissao.set(admissao)
    end

    def preencher_cargo(cargo)
        puts "Preenchendo CARGO"
        inputCargo.set(cargo)
    end

    def preencher_salario(salario)
        puts "Preenchendo SALARIO"
        inputSalario.set(salario)
    end

    def selecionar_tipo_contratacao(contratacao)
        puts "Selecionando tipo contratacao"
        case contratacao.upcase
        when "CLT"
            radioCLT.click
        when "PJ"
            radioPJ.click
        else
            
        end
    end

    def validar_campos(msg, campo)
        puts "Validando campo"
        case campo.upcase
        when "NOME"
            @texto = inputNome.native.attribute("validationMessage")
            expect(@texto).to eq msg
        when "CPF"
            @texto = inputCPF.native.attribute("validationMessage")
            expect(@texto).to eq msg
        when "SEXO"
            @texto = selectSexo.native.attribute("validationMessage")
            expect(@texto).to eq msg
        when "ADMISSAO"
            @texto = inputAdmissao.native.attribute("validationMessage")
            expect(@texto).to eq msg
        when "CARGO"
            @texto = inputCargo.native.attribute("validationMessage")
            expect(@texto).to eq msg
        when "SALARIO"
            @texto = inputSalario.native.attribute("validationMessage")
            expect(@texto).to eq msg
        when "CONTRATACAO"
            @texto = radioCLT.native.attribute("validationMessage")
            expect(@texto).to eq msg
        else
            assert_equal("Selecione algum dos campos obrigatórios: Nome, CPF, Sexo, Admissao, Cargo, Salario ou Contracacao", campo, "ERRO")
        end
    end

    def validar_alerta_cpf_invalido
        puts "Validando alerta"
        @alerta = page.driver.browser.switch_to.alert.text
        expect(@alerta).to eq "CPF Invalido!"
        sleep(2)
        page.driver.browser.switch_to.alert.accept
        sleep(2)
    end

    def validar_funcionario_cadastrado
        puts "Validando funcionario cadastrado"
       @nome = recuperar_nome("features/massa/nome_funcionario.txt")
       @admissao = recuperar_nome("features/massa/admissao_funcionario.txt")
       @cpf = recuperar_nome("features/massa/cpf_funcionario.txt")
       @cargo = recuperar_nome("features/massa/cargo_funcionario.txt")

       page.assert_text(@nome.strip)
       page.assert_text(@admissao.strip)
       page.assert_text(@cpf.strip)
       page.assert_text(@cargo.strip)

    end

    def validar_funcionario_editado
        puts "Validando Funcionario Editado"
        @nome = recuperar_nome("features/massa/nome_funcionario.txt")
        @admissao = recuperar_nome("features/massa/admissao_funcionario.txt")
        @cpf = recuperar_nome("features/massa/cpf_funcionario.txt")
        @cargo = recuperar_nome("features/massa/cargo_funcionario.txt")

        page.assert_text("Informações atualizadas com sucesso")
        page.assert_text(@cpf.strip)
        page.assert_text(@nome.strip)
        page.assert_text(@admissao.strip)
        page.assert_text(@cargo.strip)
        
    end

    def clicar_editar_funcionario
        puts "Clicando em editar"
        @cpf = recuperar_nome("features/massa/cpf_funcionario.txt")
        @funcionario = find(:xpath, "//*[text()[contains(.,'#{@cpf.strip}')]]/../td[6]/a[2]/button").click
    end

    def clicar_excluir_funcionario(func)
        puts "Clicando em excluir"
        @cpf = recuperar_nome("features/massa/cpf_funcionario.txt")
        @funcionario = find(:xpath, "//*[text()[contains(.,'#{@cpf.strip}')]]/../td[6]/a[1]/button").click
        #driver.find_element(:xpath, "//*[text()[contains(.,'#{func}')]]/../td[6]/a[1]/button").click
    end

    def validar_funcionario_excluido
        puts "Validando funcionario excluido"
        @nome = recuperar_nome("features/massa/nome_funcionario.txt")
        @admissao = recuperar_nome("features/massa/admissao_funcionario.txt")
        @cpf = recuperar_nome("features/massa/cpf_funcionario.txt")
        @cargo = recuperar_nome("features/massa/cargo_funcionario.txt")
        
        page.assert_text("Funcionário removido com sucesso")
        expect(page.assert_no_text(@cpf.strip)).to eq true
        expect(page.assert_no_text(@nome.strip)).to eq true
        expect(page.assert_no_text(@admissao.strip)).to eq true
        expect(page.assert_no_text(@cargo.strip)).to eq true

    end
end