UNIT MainForm;

{-------------------------------------------------------------------------------------------------------------
   Description here: https://github.com/GabrielOnDelphi/DUT-My-Delphi-Utilities

   Features:
     Ignores lines that start with a comment symbol:   // { (*
-------------------------------------------------------------------------------------------------------------}

INTERFACE

USES
  System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Mask,
  ccCore, cbAppData, Vcl.WinXPanels, Vcl.CategoryButtons, InternetLabel, cbAppDataForm, Vcl.AppEvnts;

TYPE
  TfrmMain = class(TLightForm)
    CardPanel            : TCardPanel;
    crdUpgradeCode       : TCard;
    crdFileFormat        : TCard;
    crdColorPicker: TCard;
    lblDynamicalyCreated : TLabel;
    crdSpellCheck        : TCard;
    Label9               : TLabel;
    pnlLeft              : TPanel;
    Categories           : TCategoryPanelGroup;
    btnSettings          : TButton;
    cpMain               : TCategoryPanel;
    btnFileFormat        : TButton;
    btnAgUpgrade: TButton;
    btnColorPick: TButton;
    PageControl2         : TPageControl;
    tabFormatCode        : TTabSheet;
    PageControl3         : TPageControl;
    tabTryExcept         : TTabSheet;
    tabSetFocus          : TTabSheet;
    Label5               : TLabel;
    Panel13              : TPanel;
    btnUtf2Ansi: TButton;
    btnHasBom: TButton;
    btnAnsi2Utf: TButton;
    TabSheet8            : TTabSheet;
    lblBomInfo           : TLabel;
    Panel10              : TPanel;
    btnFixEnters         : TButton;
    lblFormaterInfo      : TLabel;
    Panel11              : TPanel;
    btnStartFormat       : TButton;
    tabUTF               : TTabSheet;
    Label3               : TLabel;
    Panel2               : TPanel;
    btnTryExcept: TButton;
    btnTryExcept2: TButton;
    btnHelp1             : TButton;
    Label4               : TLabel;
    Panel3               : TPanel;
    btnSetFocus2: TButton;
    btnSetFocus          : TButton;
    btnHelp2             : TButton;
    lblHomePage: TInternetLabel;
    tabFreeAndNil: TTabSheet;
    Label14: TLabel;
    Panel12: TPanel;
    btnFreeAndNil2: TButton;
    btnFreeAndNil: TButton;
    btnExtractCode: TButton;
    crdExtractCode: TCard;
    Panel14: TPanel;
    Label17: TLabel;
    LabeledEdit1: TLabeledEdit;
    btnSearchCode: TButton;
    lblDescription: TLabel;
    pnl64bit: TCategoryPanel;
    btnAgExtended: TButton;
    btnAgExtendedRec: TButton;
    btnAgPointer: TButton;
    btnAgLongInt: TButton;
    btnAgSendMsgTypeCst: TButton;
    btnAgPerform: TButton;
    btnAgWinLong: TButton;
    AppEvents: TApplicationEvents;
    CategoryPanel1: TCategoryPanel;
    btnAgIntfImpl: TButton;
    pnlMethod: TPanel;
    Label6: TLabel;
    edtMethod: TLabeledEdit;
    chkIntfName: TCheckBox;
    edtIntfName: TEdit;
    btnAgFindCode: TButton;
    procedure FormDestroy       (Sender: TObject);
    procedure StartTask      (Sender: TObject);
    procedure btnHelp1Click     (Sender: TObject);
    procedure btnHelp2Click     (Sender: TObject);
//    procedure pgMainChange      (Sender: TObject);
    procedure btnFixEntersClick (Sender: TObject);
    procedure btnSettingsClick  (Sender: TObject);
    procedure SwitchCard        (Sender: TObject);
    procedure btnMouseEnter(Sender: TObject);
  private
  public
    procedure FormInitialize; {don't forget inherited LateInitialize!} override;
  end;

VAR
  frmMain: TfrmMain;

implementation {$R *.dfm}

USES
   cmIO,
   csExecuteShell,
   ccINIFile,
   cvINIFile,
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

  // FORM: Color picker
  VAR frmClrPick: TfrmClrPick;
  AppData.CreateForm(TfrmClrPick, frmClrPick, FALSE, asPosOnly);
  frmClrPick.Container.Parent:= crdColorPicker;
  AppData.CreateFormHidden(TfrmOptions , frmOptions);
  AppData.Initializing:= FALSE;
end;


procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //SaveForm(Self);
end;




{-------------------------------------------------------------------------------------------------------------
   SWITCH GUI
-------------------------------------------------------------------------------------------------------------}
procedure TfrmMain.SwitchCard(Sender: TObject);
begin
  case (Sender as TButton).Tag of
    3: CardPanel.ActiveCard:= crdUpgradeCode;
    4: CardPanel.ActiveCard:= crdFileFormat;
    5: CardPanel.ActiveCard:= crdColorPicker;
    else MesajError('Invalid category tag!');
  end;

  lblDescription.Caption:= TDutAgentFactory.GetAgentDescription((Sender as TButton).Tag);
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
procedure TfrmMain.btnHelp1Click(Sender: TObject);
begin
 MesajInfo(
   'The tool treats the following cases: '+ crlf+
   '  1: the tool will not insert the logging code if there is a "result:= something" line after Except'+ crlf+
   '  2. the tool always inserts the logging code if there is nothing between Except/end'+ crlf+
   '  3. if there is any other code between except/and the tool does insert the logging code BUT it will write to a file so we can look manually over those cases...'+ crlf+
   '  4. The code uses try/except to calculate a result of an opperation but it uses a boolean variable (B) instead of "Result"'+ crlf+
    CRLF+
   'The program can also add a line to log the exception to a logging system. Example: DebugLog(''Exception'', ''#LogCounter)'+ crlf
   );
end;


procedure TfrmMain.btnHelp2Click(Sender: TObject);
begin
     MesajInfo('SetFocus is broken in Delphi.'+ CRLF+
               'Try to set focus on a visual control that is disabled or is invisible or simply is not focusable, and the program will crash.'+ CRLF+
               'I created a safe alternative for Delphi’s SetFocus. This tool does the batch replace.');
     ExecuteURL('https://GabrielMoraru.com/setfocus-is-broken-in-delphi/');
end;


procedure TfrmMain.btnFixEntersClick(Sender: TObject);
begin
  ExecuteShell('FixEnters.exe')
end;



procedure TfrmMain.btnSettingsClick(Sender: TObject);
begin
  frmOptions.Show;
end;



end.
