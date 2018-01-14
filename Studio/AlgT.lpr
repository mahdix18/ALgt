program AlgT;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, FrmMain, ufrmabout, UFrmVariableDeclaration, UFRMSplash, lazcontrols,
  ufrmTypeDeclaration
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Algorithme Studio';
  Application.Scaled:=True;
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TFrmMain_, FrmMain_);
  Application.CreateForm(TFrmAbout, FrmAbout);
  Application.CreateForm(TFrmVariableDeclartion, FrmVariableDeclartion);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Form2.ShowModal;
  Application.Run;
end.

