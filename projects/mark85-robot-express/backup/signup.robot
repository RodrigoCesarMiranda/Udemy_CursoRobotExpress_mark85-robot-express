*** Settings ***
Documentation    Cenários de testes do cadastro de usuários

Resource            ../resources/base.resource

Test Setup          Start Session      #gancho para rodar em cada teste separado
Test Teardown       Take Screenshot    #gancho para rodar em cada teste separado

*** Test Cases ***
Deve poder cadastar um novo usuário

    ${user}        Create Dictionary
    ...            name=Rodrigo Miranda
    ...            email=rcmiranda@hotmail.com
    ...            password=rcm123
 
    Remove user from database    ${user}[email]    #linha de código ligada a 'libs' para poder deletar o cadastro após lançamento para não conflitar nós próximos testes.

    Go to signup page
    Submit signup form    ${user}
    Notice should be      Boas vindas ao Mark85, o seu gerenciador de tarefas.   
  
#Novo teste
Não deve permitir o cadastro com email duplicado

    [Tags]    dup    #Tag serve para execução de testes únicos.

    ${user}        Create Dictionary
    ...            name=Miranda Rodrigo
    ...            email=miranda@hotmail.com
    ...            password=rcm123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    
    Go to signup page
    Submit signup form    ${user}
    Notice should be      Oops! Já existe uma conta com o e-mail informado.    #validar o texto 'equal' que é '=' o texto procurado 

#Novo Teste
Campos obrigatórios
    [Tags]    required

    ${user}    Create Dictionary
    ...        name=${EMPTY}
    ...        email=${EMPTY}
    ...        password=${EMPTY}

    Go to signup page
    Submit signup form    ${user}

    Alert should be    Informe seu nome completo
    Alert should be    Informe seu e-email
    Alert should be    Informe uma senha com pelo menos 6 digitos

#Novo Teste
Não deve cadastrar com email incorreto
    [Tags]    inv_email

    ${user}    Create Dictionary
    ...        name=Charles Xavier
    ...        email=xavier.com.br
    ...        password=123456  

    Go to signup page
    Submit signup form    ${user}
    Alert should be       Digite um e-mail válido

#Novo Teste
Não deve cadastrar com senha muito curta
    [Tags]    temp

    @{password_list}    Create List    1    12    123    1234    12345

    FOR    ${password}    IN    @{password_list}
        ${user}    Create Dictionary
        ...        name=Rodrigo Miranda
        ...        email=miranda@mns.com.br
        ...        password=${password}

        Go to signup page
        Submit signup form    ${user}

        Alert should be    Informe uma senha com pelo menos 6 digitos        
    END
    
#Novo Teste que vai de 'Não deve cadastar com senha de 1 a 5' e contém Keyword para facilitar manutenção
Não deve cadastar com senha de 1 digito
    [Tags]    short_pass
    [Template]
    Short password    1

Não deve cadastar com senha de 2 digitos
    [Tags]    short_pass
    [Template]
    Short password    12

Não deve cadastar com senha de 3 digitos
    [Tags]    short_pass
    [Template]
    Short password    123

Não deve cadastar com senha de 4 digitos
    [Tags]    short_pass
    [Template]
    Short password    1234

Não deve cadastar com senha de 5 digitos
    [Tags]    short_pass
    [Template]
    Short password    12345

*** Keywords ***
Short password
    [Arguments]    ${short_pass}

    ${user}    Create Dictionary
    ...        name=Rodrigo Miranda
    ...        email=miranda@mns.com.br
    ...        password=${short_pass}

    Go to signup page
    Submit signup form    ${user}

    Alert should be    Informe uma senha com pelo menos 6 digitos