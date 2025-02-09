UNIT MainForm;

{=============================================================================================================
   Gabriel Moraru
   2021
   See Copyright.txt
--------------------------------------------------------------------------------------------------------------
   Description here: https://github.com/GabrielOnDelphi/DUT-My-Delphi-Utilities

   Features:
     Ignores lines that start with a comment symbol:   // { (*
-------------------------------------------------------------------------------------------------------------}

INTERFACE

USES
  System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Mask, Vcl.AppEvnts,
  ccCore, cbAppData, Vcl.WinXPanels, Vcl.CategoryButtons, InternetLabel, cbAppDataForm;

TYPE
  TfrmMain = class(TLightForm)
    AppEvents           : TApplicationEvents;
    btnAgExtended       : TButton;
    btnAgExtendedRec    : TButton;
    btnAgFindCode       : TButton;
    btnAgIntfImpl       : TButton;
    btnAgLongInt        : TButton;
    btnAgPerform        : TButton;
    btnAgPointer        : TButton;
    btnAgSendMsgTypeCst : TButton;
    btnAgWinLong        : TButton;
    btnBOM              : TButton;
    btnBom_Ansi2Utf     : TButton;
    btnBom_Utf2Ansi     : TButton;
    btnColorPick        : TButton;
    btnFreeAndNil3      : TButton;
    btnHelp2            : TButton;
    btnSettings         : TButton;
    btnTryExcept4       : TButton;
    Button1             : TButton;
    Button2             : TButton;
    Categories          : TCategoryPanelGroup;
    CategoryPanel1      : TCategoryPanel;
    CategoryPanel2      : TCategoryPanel;
    CategoryPanel3      : TCategoryPanel;
    cpMain              : TCategoryPanel;
    lblDescription      : TLabel;
    lblHomePage         : TInternetLabel;
    Panel1              : TPanel;
    pnl64bit            : TCategoryPanel;
    pnlLeft             : TPanel;
    setFocus4           : TButton;
    procedure FormDestroy     (Sender: TObject);
    procedure StartTask       (Sender: TObject);
    procedure btnHelp2Click   (Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnMouseEnter   (Sender: TObject);
    procedure Button1Click    (Sender: TObject);
  public
    procedure FormInitialize; override;
  end;

VAR
  frmMain: TfrmMain;

IMPLEMENTATION {$R *.dfm}

USES
   cmIO,
   csExecuteShell,
   ccINIFile,
   cvINIFile,
   dutCodeFormat,
   dutAgentFactory,
   cbDialogs,
   FormColorPicker,
   FormOptions,
   FormExclude,
   FormAgent,
   FormEditor;

{-------------------------------------------------------------------------------------------------------------
   CONSTRUCTOR
-------------------------------------------------------------------------------------------------------------}

procedure TfrmMain.FormInitialize;
begin
  inherited FormInitialize;

  if AppData.RunningFirstTime
  then ExecuteURL('https://GabrielMoraru.com');
  {
  // FORM: Color picker
  VAR frmClrPick: TfrmClrPick;
  AppData.CreateForm(TfrmClrPick, frmClrPick, FALSE, asPosOnly);
  frmClrPick.Container.Parent:= crdColorPicker;  }
  AppData.CreateFormHidden(TfrmOptions , frmOptions);
  AppData.Initializing:= FALSE;
end;


procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //SaveForm(Self);
end;




{-------------------------------------------------------------------------------------------------------------
   SEARCH
-------------------------------------------------------------------------------------------------------------}
procedure TfrmMain.StartTask(Sender: TObject);
begin
  Assert((Sender as TButton).Tag > 0, 'Unknown tag!');
  CreateAgentForm((Sender as TButton).Tag);
  //Hide;
end;


procedure TfrmMain.btnMouseEnter(Sender: TObject);
begin
  VAR Tag:= (Sender as TButton).Tag;
  if Tag > 0
  then lblDescription.Caption:= TDutAgentFactory.GetAgentDescription(Tag);
end;




{-------------------------------------------------------------------------------------------------------------
   HELP & OTHER TOOLS
-------------------------------------------------------------------------------------------------------------}
procedure TfrmMain.btnHelp2Click(Sender: TObject);
begin
   ExecuteURL('https://GabrielMoraru.com/setfocus-is-broken-in-delphi/');
end;


procedure TfrmMain.btnSettingsClick(Sender: TObject);
begin
  frmOptions.Show;
end;



procedure TfrmMain.Button1Click(Sender: TObject);
begin
  ExecuteShell('FixEnters.exe')
end;

end.
