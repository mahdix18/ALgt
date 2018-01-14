unit UFrmVariableDeclaration;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TFrmVariableDeclartion }

  TFrmVariableDeclartion = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboType: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
  private

  public

  end;

var
  FrmVariableDeclartion: TFrmVariableDeclartion;

implementation

{$R *.lfm}

end.

