unit unitPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ZConnection;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuPrincipal: TMainMenu;
    Conn_PBD: TZConnection;
    procedure MenuItem2Click(Sender: TObject);
  private

  public

  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

uses unitestados;

{ TFormPrincipal }
procedure TFormPrincipal.MenuItem2Click(Sender: TObject);
begin
  try
    FormEstados:=TFormEstados.create(application);
    FormEstados.showmodal;
  finally
    FormEstados.free;
  end;
end;

end.

