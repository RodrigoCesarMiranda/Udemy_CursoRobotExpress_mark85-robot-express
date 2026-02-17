*** Settings ***
Documentation    Ações e elementos do componente de notificações

Library    Browser

*** Keywords ***

Notice should be        #o texto esperado deve ser ...?
    [Arguments]    ${expected_text}

    ${element}     Set Variable    css=.notice p

    Wait For Elements State    ${element}      visible    5
    Get Text                   ${element}      equal      ${expected_text}    #validar o texto 'equal' que é '=' o texto procurado
