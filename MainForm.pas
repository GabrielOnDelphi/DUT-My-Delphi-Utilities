UNIT MainForm;

{=============================================================================================================
   Gabriel Moraru
   2021
   www.GabrielMoraru.com
   See Copyright file
--------------------------------------------------------------------------------------------------------------
   Description here: https://github.com/GabrielOnDelphi/DUT-My-Delphi-Utilities

   Features:
     Ignores lines that start with a comment symbol:   // { (*
-------------------------------------------------------------------------------------------------------------}
//ToDo: remember which panels were collapsed
//ToDo: freezes when typing in "path"Apply button in LDU, in Path
//ToDo: button to allow user so save gui

INTERFACE

USES
  System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Mask, Vcl.AppEvnts,
  LightCore, LightCore.AppData, LightVcl.Common.AppData, Vcl.WinXPanels, Vcl.CategoryButtons, InternetLabel, LightVcl.Common.AppDataForm, LightVcl.Visual.CheckBox;

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
    btnCrLf             : TButton;
    Button2             : TButton;
    Categories          : TCategoryPanelGroup;
    catSearch           : TCategoryPanel;
    catImprove          : TCategoryPanel;
    catText             : TCategoryPanel;
    catTools            : TCategoryPanel;
    lblDescription      : TLabel;
    lblHomePage         : TInternetLabel;
    Panel1              : TPanel;
    cat64bit            : TCategoryPanel;
    pnlLeft             : TPanel;
    setFocus4           : TButton;
    btnHelp2            : TButton;
    lblNoteOta          : TInternetLabel;
    chkReopenLast       : TCubicCheckBox;
    chkHideMainForm     : TCubicCheckBox;
    procedure StartTask       (Sender: TObject);
    procedure btnHelp2Click   (Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnMouseEnter   (Sender: TObject);
    procedure btnCrLfClick    (Sender: TObject);
    procedure btnColorPickClick(Sender: TObject);
  private
    LastAgent: Integer;   // Used to restore the last agent
  public
    procedure FormPostInitialize; override;
    procedure FormPreRelease;     override;
  end;

VAR
  frmMain: TfrmMain;

IMPLEMENTATION {$R *.dfm}

USES
   LightVcl.Common.IO,
   LightVcl.Common.AppData,
   LightVcl.Common.ExecuteShell,
   LightCore.INIFile,
   LightVcl.Visual.INIFile,
   dutCodeFormat,
   dutAgentFactory,
   LightVcl.Common.Dialogs,
   LightVcl.Common.IniFileQuick,
   FormColorPicker,
   FormOptions,
   FormExclude,
   FormAgent,
   FormEditor;


{-------------------------------------------------------------------------------------------------------------
   CONSTRUCTOR
-------------------------------------------------------------------------------------------------------------}

procedure TfrmMain.FormPostInitialize;
begin
  inherited FormPostInitialize;

  if AppData.RunningFirstTime
  then ExecuteURL(AppData.ProductWelcome);

  AppData.CreateFormHidden(TfrmOptions, frmOptions, asFull);
  AppData.Initializing:= FALSE;

  // Reopen the last agent
  LastAgent:= ReadInteger('LastAgent', -1);
  if chkReopenLast.Checked AND (LastAgent > 0)
  then CreateAgentForm(LastAgent);

  if chkHideMainForm.Checked then Hide;
end;


procedure TfrmMain.FormPreRelease;
begin
  WriteInteger('LastAgent', LastAgent);
end;




{-------------------------------------------------------------------------------------------------------------
   SEARCH
-------------------------------------------------------------------------------------------------------------}
procedure TfrmMain.StartTask(Sender: TObject);
begin
  Assert((Sender as TButton).Tag > 0, 'Unknown tag!');

  LastAgent:= (Sender as TButton).Tag;
  CreateAgentForm(LastAgent);
end;


procedure TfrmMain.btnMouseEnter(Sender: TObject);
begin
  VAR Tag:= (Sender as TButton).Tag;
  if Tag > 0
  then lblDescription.Caption:= TDutAgentFactory.GetAgentDescription(Tag)
  else lblDescription.Caption:= '';
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



procedure TfrmMain.btnCrLfClick(Sender: TObject);
begin
  ExecuteShell('FixEnters.exe')
end;


procedure TfrmMain.btnColorPickClick(Sender: TObject);
begin
  AppData.CreateFormModal(TfrmClrPick, asFull);
end;


end.
