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
    btnSettings         : TButton;
    btnTryExcept4       : TButton;
    Button1             : TButton;
    Button2             : TButton;
    Categories          : TCategoryPanelGroup;
    catSearch: TCategoryPanel;
    catImprove: TCategoryPanel;
    catText: TCategoryPanel;
    catTools: TCategoryPanel;
    lblDescription      : TLabel;
    lblHomePage         : TInternetLabel;
    Panel1              : TPanel;
    cat64bit: TCategoryPanel;
    pnlLeft             : TPanel;
    setFocus4           : TButton;
    btnHelp2: TButton;
    procedure FormDestroy     (Sender: TObject);
    procedure StartTask       (Sender: TObject);
    procedure btnHelp2Click   (Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnMouseEnter   (Sender: TObject);
    procedure Button1Click    (Sender: TObject);
    procedure btnColorPickClick(Sender: TObject);
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


procedure TfrmMain.btnColorPickClick(Sender: TObject);
begin
  AppData.CreateFormModal(TfrmClrPick, asFull);
end;


end.
