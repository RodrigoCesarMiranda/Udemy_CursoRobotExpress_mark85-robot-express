*** Settings ***
Documentation     Online

Resource    ..//resources/base.resource

*** Test Cases ***
Webapp deve estar online

    Start Session    #está iniciando a seção do navegador, essa configuração foi feita em resources
    Get Title       equal        Mark85 by QAx


