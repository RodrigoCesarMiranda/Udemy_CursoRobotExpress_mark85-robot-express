*** Settings ***
Documentation    Ações e elementos do cabeçalho do mark85

Library    String    #Biblioteca para poder validar a massa de dados que contém nome e sobrenome e assim poder validar somente o 'nome'
Library    Browser

*** Keywords ***
User should be logged in
    [Arguments]    ${name}

    @{splited_name}    Split String    ${name}    #Buscar e validar somente o primeiro nome
    ${element}         Set Variable    css=header .right small   

    Wait For Elements State    ${element}
    ...    visible    5

    Get Text    ${element}    equal    Olá, ${splited_name}[0]

Go to task form
    Click    css=.button-add