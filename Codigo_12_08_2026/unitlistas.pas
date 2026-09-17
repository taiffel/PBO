unit unitlistas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CheckLst;

type

  { TFormListas }

  TFormListas = class(TForm)
    BotaoMover12: TButton;
    BotaoMover21: TButton;
    BotaoCopiar12: TButton;
    BotaoCopiar21: TButton;
    BotaoSair: TButton;
    Lista1: TListBox;
    Lista2: TListBox;
    procedure BotaoCopiar12Click(Sender: TObject);
    procedure BotaoCopiar21Click(Sender: TObject);
    procedure BotaoMover12Click(Sender: TObject);
    procedure BotaoMover21Click(Sender: TObject);
    procedure BotaoSairClick(Sender: TObject);
  private

  public

  end;

var
  FormListas: TFormListas;

implementation

{$R *.lfm}

{ TFormListas }

procedure TFormListas.BotaoSairClick(Sender: TObject);
begin
  close;
end;

procedure TFormListas.BotaoMover12Click(Sender: TObject);
begin
if (messagedlg('Confirma',mtconfirmation,[mbyes,mbno],0)
=mrno) then exit;

 Lista2.Items.add(Lista1.items[Lista1.ItemIndex]);
 Lista1.Items.delete(Lista1.ItemIndex);
end;

procedure TFormListas.BotaoCopiar12Click(Sender: TObject);
var linha:integer;
begin
 for linha:=0 to Lista1.items.count-1 do
  Lista2.items.add(Lista1.items[linha]);
end;

procedure TFormListas.BotaoCopiar21Click(Sender: TObject);
var linha:integer;
begin
 for linha:=0 to Lista2.items.count-1 do
  Lista1.items.add(Lista2.items[linha]);
end;

procedure TFormListas.BotaoMover21Click(Sender: TObject);
begin
if (messagedlg('Confirma',mtconfirmation,[mbyes,mbno],0)
=mrno) then exit;

 Lista1.Items.add(Lista2.items[Lista2.ItemIndex]);
 Lista2.Items.delete(Lista2.ItemIndex);
end;

end.

