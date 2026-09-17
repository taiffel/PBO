unit unitprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ZConnection;

type

  { TFormprincipal }

  TFormprincipal = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    conn1: TZConnection;
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private

  public

  end;

var
  Formprincipal: TFormprincipal;

implementation

{$R *.lfm}

uses unitclientes, unitprodutos, unitvendas;

{ TFormprincipal }

procedure TFormprincipal.MenuItem2Click(Sender: TObject);
begin
  try
    FormClientes:=TFormClientes.create(application);
    FormClientes.ShowModal;
  finally
    FormClientes.free;
  end;
end;

procedure TFormprincipal.MenuItem3Click(Sender: TObject);
begin
  try
    FormProdutos:=TFormProdutos.create(application);
    FormProdutos.ShowModal;
  finally
    FormProdutos.free;
  end;
end;

procedure TFormprincipal.MenuItem4Click(Sender: TObject);
begin
  try
    FormVendas:=TFormVendas.create(application);
    FormVendas.ShowModal;
  finally
    FormVendas.free;
  end;
end;

end.

