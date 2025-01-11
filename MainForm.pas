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
    crdSearch            : TCard;
    pnlMethod            : TPanel;
    Label6               : TLabel;
    edtMethod            : TLabeledEdit;
    Button4              : TButton;
    chkIntfName          : TCheckBox;
    edtIntfName          : TEdit;
    crdUpgradeCode       : TCard;
    crdWin64             : TCard;
    crdFileFormat        : TCard;
    crdUtils             : TCard;
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
    btnUtils             : TButton;
    PageControl2         : TPageControl;
    tabFormatCode        : TTabSheet;
    PageControl3         : TPageControl;
    tabTryExcept         : TTabSheet;
    tabSetFocus          : TTabSheet;
    Label5               : TLabel;
    Panel13              : TPanel;
    Button5              : TButton;
    Button6              : TButton;
    Button7              : TButton;
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
    Button1              : TButton;
    btnReplace           : TButton;
    btnHelp1             : TButton;
    Label4               : TLabel;
    Panel3               : TPanel;
    btnReplaceFocus      : TButton;
    btnSetFocus          : TButton;
    btnHelp2             : TButton;
    Label15              : TLabel;
    Label16              : TLabel;
    tabPointerLongInt    : TTabSheet;
    Label18              : TLabel;
    Panel4               : TPanel;
    Button11             : TButton;
    Label12              : TLabel;
    Button3              : TButton;
    tabExtendedRec: TTabSheet;
    Label11: TLabel;
    Label13: TLabel;
    Panel9: TPanel;
    btnExtendedRec: TButton;
    lblHomePage: TInternetLabel;
    procedure FormDestroy       (Sender: TObject);
    procedure StartSearch2      (Sender: TObject);
    procedure btnHelp1Click     (Sender: TObject);
    procedure btnHelp2Click     (Sender: TObject);
    procedure pgMainChange      (Sender: TObject);
    procedure btnFixEntersClick (Sender: TObject);
    procedure btnSettingsClick  (Sender: TObject);
    procedure SwitchCard        (Sender: TObject);
    procedure Button3Click      (Sender: TObject);
  private
    PasParser: TDutUtils;
    procedure lateInitialize; override;
  end;

VAR
  frmMain: TfrmMain;

implementation {$R *.dfm}

USES
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

  PasParser:= TDutUtils.Create;
  PasParser.BackupFile:= True;

  // FORM: Color picker
  VAR frmClrPick: TfrmClrPick;
  AppData.CreateForm(TfrmClrPick, frmClrPick, FALSE, flPosOnly, crdUtils, TRUE);
  frmClrPick.Visible:= True;
  frmClrPick.Align:= alClient;

  // FORM: Results
  AppData.CreateFormHidden(TfrmEditor  , frmEditor);
  AppData.CreateFormHidden(TfrmOptions , frmOptions);
  AppData.CreateFormHidden(TfrmResults , frmResults);
  AppData.CreateFormHidden(TfrmExplorer, frmExplorer, flFull); // Requires frmResults
  AppData.CreateFormHidden(TfrmExclude , frmExclude);
  frmExplorer.Container.Parent:= Self;
  AppData.Initializing:= False;

  Refresh;                         // Refresh the main form so the frmExplorer is shown in the correct position
  frmExplorer.edtPathChange(NIL);  // Read files in folder. This could take a while for large folders
  frmResults.Caption:= 'Files in '+ frmExplorer.edtPath.Text;
  //frmResults.ShowResultsForm;
end;


procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(PasParser);
  SaveForm(Self);
end;





{-------------------------------------------------------------------------------------------------------------
   SEARCH
-------------------------------------------------------------------------------------------------------------}

procedure TfrmMain.SwitchCard(Sender: TObject);
begin
  case (Sender as TButton).Tag of
    1: CardPanel.ActiveCard:= crdSearch;
    2: CardPanel.ActiveCard:= crdWin64;
    3: CardPanel.ActiveCard:= crdUpgradeCode;
    4: CardPanel.ActiveCard:= crdFileFormat;
    5: CardPanel.ActiveCard:= crdUtils;
    else MesajError('Invalid category tag!');
  end;
end;


procedure TfrmMain.StartSearch2(Sender: TObject);
var
   IntfName, TextFile: string;
   FoundFiles, FoundLines: Integer;
   FileList: TStringList;
begin
  FoundLines:= 0;
  FoundFiles:= 0;
  if NOT DirectoryExistMsg(frmExplorer.edtPath.Text) then Exit;
  Assert((Sender as TButton).Tag > 0, 'Unknown tag!');

  frmResults.Reset;
  frmResults.ShowResultsForm;

  Screen.Cursor:= crHourGlass;

  FileList:= ListFilesOf(frmExplorer.edtPath.Text, frmExplorer.edtFilter.Text, True, True, frmExclude.mmoExclude.Lines);
  Try
    PasParser.SearchResults.Clear;

    for TextFile in FileList do
       begin
         // Instructs the parser that we start parsing a new file. It wil create a new TSearchResult record for it.
         PasParser.NewFile(TextFile);

         // Execute
         case (Sender as TButton).Tag of

           // Find interface implementation
           1: begin
                if chkIntfName.Checked
                then IntfName:= edtIntfName.Text
                else IntfName:= '';
                PasParser.FindImplementation(edtMethod.Text, IntfName);
              end;

           // Try/Except
           3: PasParser.FindTryExcept(False);
           4: PasParser.FindTryExcept(true);

           // SetFocus
           5: PasParser.FindSetFocus(False);
           6: PasParser.FindSetFocus(True);

           // BOM
           7: PasParser.ConvertToUTF(TRUE);
           8: PasParser.ConvertToAnsi;
           9: PasParser.HasBOM;

           // WinAPI
           50: PasParser.FindSendPostMessage;        { Search for invalid typecasts in .Perform(), SendMessage(), PostMessage(). }
           51: PasParser.FindPerform;
           52: PasParser.FindSetWindowLong;          { Search for SetWindowLong and GetWindowLong. }

           // Pointer(Integer & Pointer(LongInt
           60: PasParser.FindPointer(False);         { Search for 'Pointer(Integer(' . We cannot assume anymorethat SizeOf(Pointer)=SizeOf(Integer/Cardinal/Longint). }
           61: PasParser.FindPointer(True);  //ToDo: Ask before replace
           62: PasParser.FindPointerRelax;
           63: PasParser.FindLongIntCast;            { Search for possible LongInt/PLongInt typecasts. On Windows, LongInt is always 32bit! }

           // Extended
           72: PasParser.FindExtended;               { Search for occurrences of the Extended type and reports them. }
           73: PasParser.FindPackedExtended;

           // Format code
           80: PasParser.FormatCodeTight({TRUE});
         else
           MesajError('Invalid button tag!');
         end;

         if PasParser.SearchResults.Last.Found
         then
           begin
             Inc(FoundFiles);
             Inc(FoundLines, PasParser.SearchResults.Last.Count);

             //ToDo 3: truncate file name if too long
             frmResults.lbxResults.AddItem(PasParser.SearchResults.Last.FileName + TAB+ ' Found at: '+ PasParser.SearchResults.Last.PositionsAsString, PasParser.SearchResults.Last);
             frmResults.lbxResults.Refresh;
           end
         else
           // Show files that do not contain the result
           if frmOptions.chkShowAllFiles.Checked
           then frmResults.lbxResults.Items.Add('[0x] '+ TextFile);
       end;

      Caption:= 'Done. Searched '+ IntToStr(FileList.Count)+ ' files. Found in  '+ IntToStr(FoundFiles)+ ' files.';

      // Show global statistics
      frmResults.mmoStats.Text:= '';
      frmResults.mmoStats.Lines.Add('Searched ' + IntToStr(FileList.Count)+ ' files.');
      frmResults.mmoStats.Lines.Add('Found in ' + IntToStr(FoundFiles)+ ' files.');
      frmResults.mmoStats.Lines.Add('Total positions: '+ IntToStr(FoundLines));
      // Load first result
      frmResults.LoadFirstResult;
  FINALLY
    Screen.Cursor:= crDefault;
    FreeAndNil(FileList);
  END;
end;


{-------------------------------------------------------------------------------------------------------------
   GUI
-------------------------------------------------------------------------------------------------------------}
procedure TfrmMain.pgMainChange(Sender: TObject);
begin
  if AppData.Initializing then Exit;

  if (frmResults.Container.Parent <> CardPanel.ActiveCard)
  AND ((CardPanel.ActiveCard = crdSearch)
    or (CardPanel.ActiveCard = crdUpgradeCode)
    or (CardPanel.ActiveCard = crdWin64)
    or (CardPanel.ActiveCard = crdUtils) )
  then
    begin
      //pgMain.Update;
      PasParser.SearchResults.Clear;
      frmResults.Reset;

      // Show it only if docked
      if NOT frmOptions.chkNewWnd.Checked
      then frmResults.Container.Parent:= CardPanel.ActiveCard;
    end;
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


procedure TfrmMain.Button3Click(Sender: TObject);
begin
  frmResults.ShowResultsForm;
end;

end.
