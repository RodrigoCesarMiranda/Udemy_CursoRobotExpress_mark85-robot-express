# 🤖 Automação de Testes - Projeto Mark85 (Robot Express)

Este repositório é o meu portfólio de automação de testes funcionais, desenvolvido durante o curso **Robot Express na Udemy**. Aqui você encontrará tanto a aplicação testada (API e Frontend) quanto os scripts de automação utilizando **Robot Framework**.

---

## 🏗️ 1. Estrutura do Projeto
O repositório está organizado da seguinte forma:
- 📁 **/apps/mark85**: Contém o código-fonte da aplicação (API e WEB) que é o nosso alvo de teste (SUT).
- 📁 **/projects/mark85-robot-express**: Contém os scripts de automação, suítes de teste e recursos do Robot Framework.

---

## 🌐 2. Configuração do Ambiente (System Under Test)

Para que os testes do Robot funcionem, você precisa subir os serviços da aplicação primeiro. Abra dois terminais e siga a ordem:

### 🔹 Passo 1: Iniciar a API (Backend)
1. Vá até a pasta: `cd apps/mark85/api`
2. Instale as dependências: `npm install` (apenas na primeira vez)
3. Inicie o serviço: `npm run dev`
4. **Porta ativa:** `3333`

### 🔹 Passo 2: Iniciar a Web (Frontend)
1. Vá até a pasta: `cd apps/mark85/web`
2. Instale as dependências: `npm install` (apenas na primeira vez)
3. Inicie o serviço: `npm run dev`
4. **Porta ativa:** `3000`

---

## 🚀 3. Execução dos Testes (Robot Framework)

Com a API e a Web rodando, abra um novo terminal na pasta do projeto de testes (`projects/mark85-robot-express`) e utilize os comandos abaixo:

### ✅ Rodar todos os testes
```bash
robot -d ./logs tests/

🏷️ Rodar por TAG específica (Ex: xxxxx)
Ideal para execuções parciais ou grupos de testes:
robot -d ./logs -i xxxxx tests/

📄 Rodar uma Suíte (Arquivo) específica
robot -d ./logs tests/nome_da_suite.robot

🚫 Ignorar testes com uma TAG (Ex: wip)
robot -d ./logs -e wip tests/


🛠️ Tecnologias e Bibliotecas
Linguagem: Robot Framework

Library Principal: Browser Library (Playwright)

Node.js: Para execução dos apps Mark85.

Relatórios: Gerados automaticamente pelo Robot em ./logs.

✍️ Autor
Rodrigo Miranda

GitHub