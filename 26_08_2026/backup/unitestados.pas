unit unitEstados;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  DBCtrls, Buttons, ZDataset, ZAbstractRODataset;

type

  { TFormEstados }

  TFormEstados = class(TForm)
    DataSourceEstados: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGridDados: TDBGrid;
    GrupoDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QueryEstados: TZQuery;
    BotaoInserir: TSpeedButton;
    BotaoAlterar: TSpeedButton;
    BotaoExcluir: TSpeedButton;
    BotaoConfirmar: TSpeedButton;
    BotaoCancelar: TSpeedButton;
    BotaoSair: TSpeedButton;
    QueryEstadoscodigoestado: TZIntegerField;
    QueryEstadosnomeestado: TZRawStringField;
    QueryEstadossiglaestado: TZRawStringField;
    procedure BotaoAlterarClick(Sender: TObject);
    procedure BotaoCancelarClick(Sender: TObject);
    procedure BotaoConfirmarClick(Sender: TObject);
    procedure BotaoExcluirClick(Sender: TObject);
    procedure BotaoInserirClick(Sender: TObject);
    procedure BotaoSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    procedure ControleInterface(acao:boolean);
  end;

var
  FormEstados: TFormEstados;

implementation

{$R *.lfm}

uses unitprincipal;

{ TFormEstados }

procedure TFormEstados.BotaoSairClick(Sender: TObject);
begin
  close;
end;

procedure TFormEstados.FormShow(Sender: TObject);
begin
  QueryEstados.open;
end;

procedure TFormEstados.ControleInterface(acao: boolean);
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

procedure TFormEstados.BotaoInserirClick(Sender: TObject);
begin
  ControleInterface(false);
  DBEdit1.SetFocus;
  QueryEstados.Append;
end;

procedure TFormEstados.BotaoAlterarClick(Sender: TObject);
begin
  ControleInterface(false);
  DBEdit1.SetFocus;
  QueryEstados.Edit;
end;

procedure TFormEstados.BotaoCancelarClick(Sender: TObject);
begin
  QueryEstados.cancel;
  ControleInterface(true);
end;

procedure TFormEstados.BotaoConfirmarClick(Sender: TObject);
begin
  QueryEstados.ApplyUpdates;
  ControleInterface(true);
end;

procedure TFormEstados.BotaoExcluirClick(Sender: TObject);
begin
  if (messagedlg('Confirma exclusão do dado selecionado',
  mtconfirmation,[mbyes,mbno],0)=mryes) then
  begin
    QueryEstados.delete;
    QueryEstados.close;
    QueryEstados.open;
  end;
end;

end.

