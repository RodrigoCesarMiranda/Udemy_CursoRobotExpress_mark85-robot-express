*** Settings ***    
Documentation    Elementos e ações da página de cadastro

Library     Browser
Resource    ../env.resource

*** Keywords ***
Go to signup page         #vai para a página de castro

    Go To    ${BASE_URL}/signup    #nesse caso o navegador é pra uma página de criar cadastro

# Checkpoint, serve para avaliar que se vc está realmente na página correta
    Wait For Elements State    css=h1    visible    5  #essa keyword só verifica se o elemento existe
    Get Text                   css=h1    equal      Faça seu cadastro    #validar o texto 'equal' que é '=' o texto procurado

Submit signup form        #submeter o formulário de cadastro
    [Arguments]    ${user}

    Fill Text      css=input[name=name]        ${user}[name]
    Fill Text      css=input[name=email]       ${user}[email]
    Fill Text      css=input[name=password]    ${user}[password]
    
    Click          css=button[type=submit] >> text=Cadastrar
