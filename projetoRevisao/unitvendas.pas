unit unitvendas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  Buttons, DBCtrls, ZDataset, ZSqlUpdate, ZAbstractRODataset;

type

  { TFormvendas }

  TFormvendas = class(TForm)
    DataSourceClientes: TDataSource;
    DataSourceProdutos: TDataSource;
    DataSourceVendas: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGridVendas: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GrupoDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    QueryClientesid_cliente: TZIntegerField;
    QueryClientesnome: TZRawStringField;
    QueryProdutosid_produto: TZIntegerField;
    QueryProdutosnome: TZRawStringField;
    QueryVendas: TZQuery;
    QueryVendasdata_venda: TZDateField;
    QueryVendasid_cliente: TZIntegerField;
    QueryVendasid_produto: TZIntegerField;
    QueryVendasid_venda: TZIntegerField;
    QueryVendasquantidade: TZIntegerField;
    QueryVendasvalor_total: TZBCDField;
    BotaoInserir: TSpeedButton;
    BotaoAlterar: TSpeedButton;
    BotaoExcluir: TSpeedButton;
    BotaoConfirmar: TSpeedButton;
    BotaoCancelar: TSpeedButton;
    BotaoSair: TSpeedButton;
    UpdateSQLVendas: TZUpdateSQL;
    QueryClientes: TZQuery;
    QueryProdutos: TZQuery;
    procedure BotaoAlterarClick(Sender: TObject);
    procedure BotaoCancelarClick(Sender: TObject);
    procedure BotaoConfirmarClick(Sender: TObject);
    procedure BotaoExcluirClick(Sender: TObject);
    procedure BotaoInserirClick(Sender: TObject);
    procedure BotaoSairClick(Sender: TObject);
  private

  public
    procedure acoes(valor:boolean);

  end;

var
  Formvendas: TFormvendas;

implementation

{$R *.lfm}

uses unitprincipal;

{ TFormvendas }



procedure TFormvendas.BotaoSairClick(Sender: TObject);
begin
  close;
end;

procedure TFormvendas.BotaoInserirClick(Sender: TObject);
begin
  acoes(false);
  DbEdit1.setfocus;
  QueryVendas.append;
end;

procedure TFormvendas.BotaoAlterarClick(Sender: TObject);
begin
  acoes(false);
  DbEdit1.setfocus;
  QueryVendas.edit;
end;

procedure TFormvendas.BotaoCancelarClick(Sender: TObject);
begin
  acoes(true);
  QueryVendas.cancel;
end;

procedure TFormvendas.BotaoConfirmarClick(Sender: TObject);
begin
  acoes(true);
  QueryVendas.applyupdates;
end;

procedure TFormvendas.BotaoExcluirClick(Sender: TObject);
begin
if (messagedlg('Confirma',mtconfirmation,[mbyes,mbno],0)=mryes) then
 QueryVendas.delete;
end;

procedure TFormvendas.acoes(valor: boolean);
begin
  DBGridVendas.Enabled:=valor;
  GrupoDados.Enabled:=not valor;
  BotaoInserir.Enabled:=valor;
  BotaoAlterar.Enabled:=valor;
  BotaoExcluir.Enabled:=valor;
  BotaoConfirmar.Enabled:=not valor;
  BotaoCancelar.Enabled:=not valor;
  BotaoSair.Enabled:=valor;
end;

end.

