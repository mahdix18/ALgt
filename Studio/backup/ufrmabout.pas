unit ufrmabout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TFrmAbout }

  TFrmAbout = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  FrmAbout: TFrmAbout;

implementation

{$R *.lfm}

{ TFrmAbout }

procedure TFrmAbout.Image1Click(Sender: TObject);
begin

end;

procedure TFrmAbout.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

