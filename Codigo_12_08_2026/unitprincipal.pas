unit unitprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Separator1: TMenuItem;
    MenuPrincipal: TMainMenu;
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private

  public

  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

uses unitlistas;

{ TFormPrincipal }

procedure TFormPrincipal.MenuItem2Click(Sender: TObject);
begin
  try
    FormListas:=TFormListas.Create(Application);
    FormListas.ShowModal;
  finally
    FormListas.free;
  end;
end;

procedure TFormPrincipal.MenuItem3Click(Sender: TObject);
begin
  close;
end;

end.

