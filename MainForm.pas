UNIT MainForm;

{-------------------------------------------------------------------------------------------------------------
   Description here: https://github.com/GabrielOnDelphi/DUT-My-Delphi-Utilities

   Features:
     Ignores lines that start with a comment symbol:   // { (*
-------------------------------------------------------------------------------------------------------------}

INTERFACE

USES
  Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Mask,
  cmSearchResult, ccCore, cbAppData, dutCodeUtils, Vcl.WinXPanels, Vcl.CategoryButtons, InternetLabel, cbAppDataForm;

TYPE
  TfrmMain = class(TLightForm)
    CardPanel            : TCardPanel;
    crdIntfImplementor: TCard;
    pnlMethod            : TPanel;
    Label6               : TLabel;
    edtMethod            : TLabeledEdit;
    Button4              : TButton;
    chkIntfName          : TCheckBox;
    edtIntfName          : TEdit;
    crdUpgradeCode       : TCard;
    crdWin64             : TCard;
    crdFileFormat        : TCard;
    crdColorPicker: TCard;
    Label1               : TLabel;
    pgWin64              : TPageControl;
    tabExtended          : TTabSheet;
    Label7               : TLabel;
    Label8               : TLabel;
    Panel7               : TPanel;
    btnExtended          : TButton;
    tabPointerInteger    : TTabSheet;
    Label10              : TLabel;
    lblPtrIssues         : TLabel;
    Panel6               : TPanel;
    Panel1               : TPanel;
    Button2              : TButton;
    btnPointer2          : TButton;
    btnPointer1          : TButton;
    TabSheet1            : TTabSheet;
    Label2               : TLabel;
    lblWinApiIssues      : TLabel;
    pnlButtons           : TPanel;
    btnSendMsgGlobal     : TButton;
    btnSendMsgTypeCst    : TButton;
    TabSheet3            : TTabSheet;
    lblWinApiIssues2     : TLabel;
    Panel5               : TPanel;
    btnPerform           : TButton;
    tabSetWinLong        : TTabSheet;
    lblWinApiIssues3     : TLabel;
    Panel8               : TPanel;
    btnWinLong           : TButton;
    lblDynamicalyCreated : TLabel;
    crdSpellCheck        : TCard;
    Label9               : TLabel;
    pnlLeft              : TPanel;
    Categories           : TCategoryPanelGroup;
    btnSettings          : TButton;
    cpMain               : TCategoryPanel;
    btnFileFormat        : TButton;
    btnSearch            : TButton;
    btnMigrate           : TButton;
    btnUpgrade           : TButton;
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
    Label15              : TLabel;
    Label16              : TLabel;
    tabPointerLongInt    : TTabSheet;
    Label18              : TLabel;
    Panel4               : TPanel;
    Button11             : TButton;
    Label12              : TLabel;
    btnShowResults: TButton;
    tabExtendedRec: TTabSheet;
    Label11: TLabel;
    Label13: TLabel;
    Panel9: TPanel;
    btnExtendedRec: TButton;
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
    procedure FormDestroy       (Sender: TObject);
    procedure StartTask      (Sender: TObject);
    procedure btnHelp1Click     (Sender: TObject);
    procedure btnHelp2Click     (Sender: TObject);
//    procedure pgMainChange      (Sender: TObject);
    procedure btnFixEntersClick (Sender: TObject);
    procedure btnSettingsClick  (Sender: TObject);
    procedure SwitchCard        (Sender: TObject);
  private
  public
    procedure LateInitialize; override;
  end;

VAR
  frmMain: TfrmMain;

implementation {$R *.dfm}

USES
   dutBase,
   ccIO, ccTextFile,
   cmIO,
   csExecuteShell,
   csSystem,
   ccINIFile,
   dutWin64,
   cvINIFile,
   cbDialogs,
   FormColorPicker,
   FormOptions,
   FormExclude,
   FormExplorer,
   FormResults, FormEditor;



{-------------------------------------------------------------------------------------------------------------
   CONSTRUCTOR
-------------------------------------------------------------------------------------------------------------}

procedure TfrmMain.LateInitialize;
begin
  inherited LateInitialize;

  if AppData.RunningFirstTime
  then ExecuteURL('https://GabrielMoraru.com');

  // FORM: Color picker
  VAR frmClrPick: TfrmClrPick;
  AppData.CreateForm(TfrmClrPick, frmClrPick, FALSE, flPosOnly);
  frmClrPick.Container.Parent:= crdColorPicker;

  // FORM: Results
  AppData.CreateFormHidden(TfrmEditor  , frmEditor);
  AppData.CreateFormHidden(TfrmOptions , frmOptions);
  AppData.CreateFormHidden(TfrmExplorer, frmExplorer, flFull); // Requires frmResults
  AppData.CreateFormHidden(TfrmExclude , frmExclude);
  frmExplorer.Container.Parent:= Self;
  AppData.Initializing:= False;

  Refresh;                         // Refresh the main form so the frmExplorer is shown in the correct position
  frmExplorer.edtPathChange(NIL);  // Read files in folder. This could take a while for large folders
end;


procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  SaveForm(Self);
end;




{-------------------------------------------------------------------------------------------------------------
   SWITCH GUI
-------------------------------------------------------------------------------------------------------------}
procedure TfrmMain.SwitchCard(Sender: TObject);
begin
  case (Sender as TButton).Tag of
    1: CardPanel.ActiveCard:= crdIntfImplementor;
    2: CardPanel.ActiveCard:= crdWin64;
    3: CardPanel.ActiveCard:= crdUpgradeCode;
    4: CardPanel.ActiveCard:= crdFileFormat;
    5: CardPanel.ActiveCard:= crdColorPicker;
    else MesajError('Invalid category tag!');
  end;
end;



{-------------------------------------------------------------------------------------------------------------
   SEARCH
-------------------------------------------------------------------------------------------------------------}
procedure TfrmMain.StartTask(Sender: TObject);
VAR
  frmResults: TfrmResults;
begin
  if NOT DirectoryExistMsg(frmExplorer.edtPath.Text) then Exit;
  Assert((Sender as TButton).Tag > 0, 'Unknown tag!');

  AppData.CreateFormHidden(TfrmResults , frmResults);
  frmResults.Caption:= 'Files in '+ frmExplorer.edtPath.Text;
  frmResults.ShowResultsForm;

  frmResults.StartTask((Sender as TButton).Tag);
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
