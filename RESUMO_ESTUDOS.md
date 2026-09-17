# 📚 Resumo de Estudos - Programação com Banco de Dados (PBO)

**Última atualização**: 17/09/2026  
**Status**: Em progresso  
**Objetivo**: Preparação para avaliação com suporte de IA

---

## 📋 Índice
1. [O que é PBO](#o-que-é-pbo)
2. [Fluxo do Professor](#fluxo-do-professor)
3. [Tecnologias Utilizadas](#tecnologias-utilizadas)
4. [Estrutura de Exercícios](#estrutura-de-exercícios)
5. [Padrões de Código](#padrões-de-código)
6. [Plano de Aprendizado](#plano-de-aprendizado)

---

## O que é PBO?

**PBO = Programação com Banco de Dados**

Disciplina que ensina a criar aplicações desktop em **Lazarus** que se conectam a um banco de dados **PostgreSQL**, permitindo criar, ler, atualizar e deletar dados (CRUD).

### Fluxo típico de um projeto:
```
1. PostgreSQL (criar banco de dados + tabelas)
   ↓
2. Lazarus (criar interfaces visuais)
   ↓
3. Zeos (conectar Lazarus ao PostgreSQL)
   ↓
4. Implementar operações CRUD
```

---

## Fluxo do Professor

O professor estrutura as aulas assim:

### **Fase 1: Exercícios Simples (05_07_2026)**
- **exe1, exe2, exe3, exe4**: Formulários BÁSICOS sem banco de dados
  - Apenas widgets: TEdit, TButton, TLabel
  - Eventos de click para manipular texto
  - **Objetivo**: Aprender interface Lazarus

### **Fase 2: Interface com Dados (Codigo_12_08_2026)**
- **projetointerface**: Formulário com componentes ligados a dados
  - Usa TDBEdit, TDBGrid (com "DB" = Database)
  - **Objetivo**: Aprender componentes vinculados

### **Fase 3: Banco de Dados Completo (26_08_2026)**
- **projeto_db**: Projeto com Estados e Cidades
  - TZConnection para conectar a PostgreSQL
  - TZQuery para executar comandos SQL
  - Relacionamento entre tabelas (FOREIGN KEY)
  - **Objetivo**: Implementar CRUD básico

### **Fase 4: Projeto Completo (projetoRevisao)**
- **projetoRevisao**: Sistema de Vendas (Estados, Cidades, Clientes, Produtos, Vendas)
  - Múltiplas tabelas com relacionamentos
  - Múltiplas forms (telas)
  - Componentes avançados: DBLookupComboBox
  - Operações CRUD completas
  - **Objetivo**: Integrar tudo aprendido

---

## Tecnologias Utilizadas

### **PostgreSQL**
Banco de dados relacional. Usar para:
- Criar usuário: `create user alunos with superuser encrypted password 'abc';`
- Criar banco: `create database pbd with owner=alunos;`
- Criar tabelas com PRIMARY KEY e FOREIGN KEY
- Executar INSERT, SELECT, UPDATE, DELETE

### **Lazarus + Free Pascal**
IDE para criar interfaces visuais. Linguagem: Object Pascal

### **Zeos (ZDataset)**
Biblioteca que conecta Lazarus ao PostgreSQL
- **TZConnection**: Gerencia a conexão
- **TZQuery**: Executa comandos SQL
- **TZIntegerField, TZRawStringField, etc**: Tipos de dados

---

## Estrutura de Exercícios

### 📁 **05_07_2026 (1)** - Exercícios Básicos
Cada exercício tem 4 arquivos principais:
- `unit1.pas` - Código da lógica
- `unit1.lfm` - Design visual
- `project1.lpr` - Arquivo principal do projeto
- `project1.lpi` - Configurações do projeto

**Padrão de Código**:
```pascal
unit Unit1;
interface
uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  end;

implementation
procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Text := 'Novo texto';
end;
end.
```

### 📁 **26_08_2026** - Projeto com Banco de Dados
- `projeto_db.lpi` - Arquivo principal
- `unitestados.pas` / `.lfm` - Formulário de Estados
- `unitcidades.pas` / `.lfm` - Formulário de Cidades
- `unitprincipal.pas` - Menu principal com TZConnection

### 📁 **projetoRevisao** - Projeto Completo de Vendas
- `unitprincipal.pas` - Menu com TZConnection
- `unitclientes.pas` - CRUD de Clientes
- `unitprodutos.pas` - CRUD de Produtos
- `unitvendas.pas` - CRUD de Vendas (com relacionamentos)

---

## Padrões de Código

### **Padrão 1: Conexão com PostgreSQL**
```pascal
conn1: TZConnection;  // Declarado na unit principal

// Propriedades configuradas no Designer:
// - Protocol: postgresql
// - HostName: localhost
// - Port: 5432
// - Database: pbd
// - User: alunos
// - Password: abc
```

### **Padrão 2: Consulta com TZQuery**
```pascal
QueryVendas: TZQuery;  // Conectado a conn1

// SQL configurado no Designer ou em tempo de execução
// QueryVendas.SQL.Text := 'SELECT * FROM vendas'
```

### **Padrão 3: Componentes Vinculados**
```pascal
DataSourceVendas: TDataSource;      // Vincula query aos componentes
DBEdit1: TDBEdit;                   // Campo ligado ao BD
DBGrid1: TDBGrid;                   // Tabela ligada ao BD
DBLookupComboBox1: TDBLookupComboBox; // Combo vinculado a outra tabela

// Propriedades:
// DataSource.DataSet := QueryVendas
// DBEdit1.DataSource := DataSourceVendas
// DBEdit1.DataField := 'id_venda'
```

### **Padrão 4: Operações CRUD**

#### **CREATE (Inserir)**
```pascal
procedure BotaoInserirClick(Sender: TObject);
begin
  acoes(false);  // Desabilita grid, habilita campos
  DBEdit1.SetFocus;
  QueryVendas.Append;  // Abre novo registro
end;

procedure BotaoConfirmarClick(Sender: TObject);
begin
  acoes(true);  // Volta ao normal
  QueryVendas.ApplyUpdates;  // Salva no banco
end;
```

#### **READ (Consultar)**
```pascal
// Automático: quando a form abre, TZQuery executa SELECT
// A data aparece no DBGrid
```

#### **UPDATE (Editar)**
```pascal
procedure BotaoAlterarClick(Sender: TObject);
begin
  acoes(false);
  QueryVendas.Edit;  // Abre registro para edição
end;

procedure BotaoConfirmarClick(Sender: TObject);
begin
  QueryVendas.ApplyUpdates;  // Salva alterações
end;
```

#### **DELETE (Deletar)**
```pascal
procedure BotaoExcluirClick(Sender: TObject);
begin
  if (MessageDlg('Confirma?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    QueryVendas.Delete;  // Remove registro
end;
```

### **Padrão 5: Função para Habilitar/Desabilitar Componentes**
```pascal
procedure acoes(valor: boolean);
begin
  DBGrid1.Enabled := valor;        // Grid ativado = valor
  GrupoDados.Enabled := not valor;  // Campos ativados = oposto
  BotaoInserir.Enabled := valor;
  BotaoAlterar.Enabled := valor;
  BotaoExcluir.Enabled := valor;
  BotaoConfirmar.Enabled := not valor;
  BotaoCancelar.Enabled := not valor;
end;
```

---

## Plano de Aprendizado

### **Semana 1: Fundamentos**
- [ ] **Dia 1-2**: Rever exercícios 05_07_2026
  - [ ] exe1: Aprender TEdit, TButton, TLabel
  - [ ] exe2: Aprender eventos de clique
  - [ ] exe3 e exe4: Práticar lógica simples
  
- [ ] **Dia 3-4**: Aprender componentes DB
  - [ ] TDBEdit vs TEdit
  - [ ] TDBGrid
  - [ ] TDataSource
  
- [ ] **Dia 5-7**: Aprender conexão PostgreSQL
  - [ ] Criar banco de dados
  - [ ] Criar tabelas
  - [ ] Conectar Lazarus com Zeos

### **Semana 2: Prática**
- [ ] Fazer exercício do projeto_db (26_08_2026)
- [ ] Fazer exercício do projetoRevisao
- [ ] Praticar CRUD completo

### **Semana 3: Revisão**
- [ ] Revisar padrões de código
- [ ] Fazer exercícios extras
- [ ] Simular prova

---

## Dúvidas Ainda Não Resolvidas
- Como configurar TZConnection exatamente no Designer
- Quais são os passos passo-a-passo no Lazarus
- Como debugar erros de conexão com PostgreSQL

---

## Próximos Passos
1. Estudar exercício exe1 em detalhes
2. Aprender componentes básicos
3. Passar para componentes DB
4. Implementar conexão PostgreSQL
5. Fazer CRUD completo

---

**Nota importante**: Este documento será atualizado conforme você envia mais materiais e dúvidas.
