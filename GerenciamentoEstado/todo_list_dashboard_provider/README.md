# Gerenciador de Tarefas com Dashboard e Provider

Especificações dos Requisitos de Software (SRE)
Documentação baseada na ISO/IEEE/IEC 29148:2018

## 1. Identificação do Projeto
Projeto: Gerenciador de Tarefas com Dashboard

Versão 1.0.0

Primeiro número -> Major = Modificações grandes de estrutura.
Segundo número -> Minor = Adição de novas funcionalidades, modificações menores.
Terceiro número -> Patch = Correções e mudanças que não influenciam a funcionalidade.

Data: 2026-04-23

## 2. Introdução

### 2.1 Propósito 
Descrever os requisitos do projeto "GID", aplicação mobile desenvolvida em flutter com uso de **Provider** e estura **MV**

### 2.2 Escopo
O Sistema Permitirá:

- Cadastrar Tarefas;
- Visualizar a lista de tarefas
- Alterar o status da tarefa
- Remover tarefas concluidas
- Visualizar indicadores indicadores consolidados em um dashboard

### 2.3 Acrônimos e Siglas
- **GTD**: Gerenciamento de Tarefas com Dashboard

### 2.4 Visão Geral
Este Documento apresenta a descrição geral do sistema, os requisitos funcionais, não-funcionais e regras de negócio.

### 3. Requisitos

### 3.1 Requisitos Funcionais

| ID | Requisito | Descrição |
|---|---|---|
| RF-001 | Criar Tarefa | O sistema deve permitir que o usuário crie uma nova tarefa com título, descrição e data de vencimento |
| RF-002 | Listar Tarefas | O sistema deve exibir todas as tarefas cadastradas em formato de lista |
| RF-003 | Atualizar Status | O sistema deve permitir alterar o status da tarefa (pendente, em progresso, concluída) |
| RF-004 | Deletar Tarefa | O sistema deve permitir remover tarefas concluídas do sistema |
| RF-005 | Filtrar Tarefas | O sistema deve permitir filtrar tarefas por status e data de vencimento |
| RF-006 | Dashboard de Indicadores | O sistema deve exibir um dashboard com estatísticas consolidadas (total de tarefas, tarefas concluídas, tarefas pendentes) |
| RF-007 | Persistência de Dados | O sistema deve manter os dados de tarefas armazenados localmente no dispositivo |
| RF-008 | Editar Tarefa | O sistema deve permitir que o usuário modifique os dados de uma tarefa existente |

## 3.2 Requisitos Não-Funcionais

## 4. Regras do Negócio