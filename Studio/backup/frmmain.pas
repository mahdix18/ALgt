unit frmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynHighlighterAny, SynEdit, SynHighlighterPas,
  SynCompletion, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, ComCtrls, ufrmabout, ATSynEdit;

type

  { TFrmMain_ }

  TFrmMain_ = class(TForm)
    ATSynEdit1: TATSynEdit;
    CoolBar1: TCoolBar;
    imglist: TImageList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    mnuApropos: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    mnuNewItem: TPopupMenu;
    ProgressBar1: TProgressBar;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    SynAlgo: TSynAnySyn;
    SynAutoComplete1: TSynAutoComplete;
    SynCompletion1: TSynCompletion;
    SynPas: TSynPasSyn;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    btntoolnewLeft: TToolButton;
    ToolButton1: TToolButton;
    TreeView1: TTreeView;

    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuAproposClick(Sender: TObject);

  private

  public

  end;

var
  FrmMain_: TFrmMain_;

implementation

{$R *.lfm}

{ TFrmMain_ }

procedure TFrmMain_.FormCreate(Sender: TObject);
     var TG,VG,PG,FG : TTreeNode;


   begin

   TG :=  TreeView1.Items.Add(nil,'Types Globales');
   TG.ImageIndex:=2;
   TG.SelectedIndex:=2;
   VG :=  TreeView1.Items.Add(nil,'Variables Globales');
   VG.ImageIndex:=2;
   VG.SelectedIndex:=2;
   PG :=  TreeView1.Items.Add(nil,'Procedures');
   PG.ImageIndex:=2;
   PG.SelectedIndex:=2;
   FG :=  TreeView1.Items.Add(nil,'Fonctions');
   FG.ImageIndex:=2;
   FG.SelectedIndex:=2;
end;

{$Include inc/menubar.inc}

procedure TFrmMain_.FormClick(Sender: TObject);

begin


end;

end.

