unit unitcidades;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Buttons, DBGrids,
  StdCtrls, DBCtrls, ZDataset, ZSqlUpdate, ZAbstractRODataset;

type

  { TFormCidades }

  TFormCidades = class(TForm)
    BotaoAlterar: TSpeedButton;
    BotaoCancelar: TSpeedButton;
    BotaoConfirmar: TSpeedButton;
    BotaoExcluir: TSpeedButton;
    BotaoInserir: TSpeedButton;
    BotaoSair: TSpeedButton;
    DataSourceEstados: TDataSource;
    DataSourceCidades: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGridDados: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    GrupoDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QueryCidades: TZQuery;
    QueryCidadescodigocidade: TZIntegerField;
    QueryCidadescodigoestado: TZIntegerField;
    QueryCidadesnomecidade: TZRawStringField;
    QueryCidadesnomeestado: TZRawStringField;
    QueryEstados: TZQuery;
    UpdateCidades: TZUpdateSQL;
    procedure BotaoAlterarClick(Sender: TObject);
    procedure BotaoCancelarClick(Sender: TObject);
    procedure BotaoConfirmarClick(Sender: TObject);
    procedure BotaoExcluirClick(Sender: TObject);
    procedure BotaoInserirClick(Sender: TObject);
    procedure BotaoSairClick(Sender: TObject);
  private

  public
    procedure ControleInterface(acao: boolean);
  end;

var
  FormCidades: TFormCidades;

implementation

{$R *.lfm}

uses unitprincipal;

procedure TFormCidades.BotaoInserirClick(Sender: TObject);
begin
  ControleInterface(false);
  DBEdit1.SetFocus;
  QueryCidades.Append;
end;

procedure TFormCidades.BotaoSairClick(Sender: TObject);
begin
  close;
end;

procedure TFormCidades.BotaoAlterarClick(Sender: TObject);
begin
  ControleInterface(false);
  DBEdit1.SetFocus;
  QueryCidades.Edit;
end;

procedure TFormCidades.BotaoCancelarClick(Sender: TObject);
begin
  QueryCidades.cancel;
  ControleInterface(true);
end;

procedure TFormCidades.BotaoConfirmarClick(Sender: TObject);
begin
  if (DBEdit1.text='') then
  begin
    messagedlg('O código é um campo obrigatório',mtwarning,[mbok],0);
    DBEdit1.setfocus;
    exit;
  end;

  if (DBEdit2.text='') then
  begin
    messagedlg('O nome da cidade é um campo obrigatório',mtwarning,[mbok],0);
    DBEdit2.setfocus;
    exit;
  end;

  if (DBLookupComboBox1.text='') then
  begin
    messagedlg('O estado é um campo obrigatório',mtwarning,[mbok],0);
    DBLookupComboBox1.setfocus;
    exit;
  end;

  QueryCidades.ApplyUpdates;
  ControleInterface(true);
  QueryCidades.close;
  QueryCidades.open;
end;

procedure TFormCidades.BotaoExcluirClick(Sender: TObject);
begin
  if (messagedlg('Confirma exclusão do dado selecionado',
  mtconfirmation,[mbyes,mbno],0)=mryes) then
  begin
    QueryCidades.delete;
    QueryCidades.close;
    QueryCidades.open;
  end;
end;

procedure TFormCidades.ControleInterface(acao: boolean);
begin
  begin
    BotaoInserir.Enabled:=acao;
    BotaoAlterar.Enabled:=acao;
    BotaoExcluir.Enabled:=acao;
    BotaoConfirmar.Enabled:=not acao;
    BotaoCancelar.Enabled:=not acao;
    BotaoSair.Enabled:=acao;
    DBGridDados.Enabled:=acao;
    GrupoDados.Enabled:=not acao;
  end;
end;



end.

