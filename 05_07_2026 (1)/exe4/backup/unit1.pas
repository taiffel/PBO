unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    EditTexto: TEdit;
    Label1: TLabel;
    Lista: TListBox;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
if (EditTexto.text<>'') then
  begin
    Lista.Items.add(EditTexto.text);
    EditTexto.clear;
  end
else
  showmessage('texto Vazio, digite algo para inserir na lista');
end;

end.

