UNIT uMainForm;

{-------------------------------------------------------------------------------------------------------------
   Description here: https://gabrielmoraru.com/xxxxxxxxxxxxxxxxx

   Issue: Does not work with some PAS files that have no BOM. The bug is in System.IOUtils.TFile.ReadAllText

   Features:
     Ignores lines that start with a comment symbol:   // { (*
-------------------------------------------------------------------------------------------------------------}

INTERFACE

USES
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  cmSearchResult, ccCore, ccAppData;

TYPE
  TfrmMain = class(TForm)
    btnExclude       : TButton;
    btnHelp1         : TButton;
    btnHelp2         : TButton;
    btnNext          : TButton;
    btnOpenIDE       : TButton;
    btnPerform       : TButton;
    btnPointer1      : TButton;
    btnPointer2      : TButton;
    btnPostMsg       : TButton;
    btnPrev          : TButton;
    btnReplace       : TButton;
    btnReplaceFocus  : TButton;
    btnReset         : TButton;
    btnSave          : TButton;
    btnSendMsgGlobal : TButton;
    btnSendMsgTypeCst: TButton;
    btnSetFocus      : TButton;
    btnTest          : TButton;
    btnWinLong       : TButton;
    Button1          : TButton;
    Button2          : TButton;
    Button3          : TButton;
    chkSaveLog       : TCheckBox;
    chkShowAllFiles  : TCheckBox;
    edtFilter        : TLabeledEdit;
    edtPath          : TLabeledEdit;
    Label1           : TLabel;
    Label2           : TLabel;
    Label3           : TLabel;
    Label4           : TLabel;
    Label5           : TLabel;
    Label9           : TLabel;
    Label11          : TLabel;
    Label13          : TLabel;
    Label14          : TLabel;
    Label15          : TLabel;
    Label16          : TLabel;
    Label17          : TLabel;
    lblCurFile       : TLabel;
    lblFormaterInfo  : TLabel;
    lblRewind        : TLabel;
    lblTools         : TLabel;
    lbxResults       : TListBox;
    Memo1            : TMemo;
    mmoStats         : TMemo;
    mmoView          : TMemo;
    mnuCopyName      : TMenuItem;
    mnuOpen          : TMenuItem;
    PageControl2     : TPageControl;
    Panel1           : TPanel;
    Panel2           : TPanel;
    Panel3           : TPanel;
    Panel5           : TPanel;
    Panel6           : TPanel;
    Panel7           : TPanel;
    Panel8           : TPanel;
    Panel9           : TPanel;
    pgBatchRepl      : TPageControl;
    pgMain           : TPageControl;
    pgTools          : TPageControl;
    pnlBtm           : TPanel;
    pnlButtons       : TPanel;
    pnlContainer     : TPanel;
    pnlFiles         : TPanel;
    pnlPath          : TPanel;
    PopupMenu        : TPopupMenu;
    Splitter         : TSplitter;
    tabColorPick     : TTabSheet;
    tabEdit          : TTabSheet;
    tabFind          : TTabSheet;
    tabFormater      : TTabSheet;
    tabOTA           : TTabSheet;
    tabReplace       : TTabSheet;
    tabSetFocus      : TTabSheet;
    tabSetWinLong    : TTabSheet;
    TabSheet1        : TTabSheet;
    TabSheet2        : TTabSheet;
    TabSheet3        : TTabSheet;
    TabSheet4        : TTabSheet;
    tabUTF: TTabSheet;
    TabSheet10       : TTabSheet;
    TabSheet11       : TTabSheet;
    TabSheet12       : TTabSheet;
    tabStats         : TTabSheet;
    tabWin64         : TTabSheet;
    TimerRew         : TTimer;
    Panel4: TPanel;
    lblBomInfo: TLabel;
    Panel10: TPanel;
    btnRemoveBOM: TButton;
    btnIsUTF: TButton;
    btnAddBOM: TButton;
    Panel11: TPanel;
    btnStartFormat: TButton;
    Panel12: TPanel;
    Label6: TLabel;
    edtMethod: TLabeledEdit;
    Button4: TButton;
    chkIntfName: TCheckBox;
    edtIntfName: TEdit;
    Button5: TButton;
    procedure btnExcludeClick    (Sender: TObject);
    procedure btnNextClick       (Sender: TObject);
    procedure btnOpenIDEClick    (Sender: TObject);
    procedure btnPrevClick       (Sender: TObject);
    procedure btnResetClick      (Sender: TObject);
    procedure btnSaveClick       (Sender: TObject);
    procedure btnTestClick       (Sender: TObject);
    procedure edtPathChange      (Sender: TObject);
    procedure FormCreate         (Sender: TObject);
    procedure FormDestroy        (Sender: TObject);
    procedure lbxResultsClick    (Sender: TObject);
    procedure lbxResultsDblClick (Sender: TObject);
    procedure mnuCopyNameClick   (Sender: TObject);
    procedure StartSearch        (Sender: TObject);
    procedure TimerRewTimer      (Sender: TObject);
    procedure btnHelp1Click      (Sender: TObject);
    procedure btnHelp2Click      (Sender: TObject);
    procedure pgMainChange       (Sender: TObject);
    procedure pgMainChanging     (Sender: TObject; var AllowChange: Boolean);
    procedure Button5Click(Sender: TObject);
  private
    Searched: Boolean;
    ExcludedFolders: TStringList;
    function GetSelectedSearch: TSearchResult;
    procedure FreeResults;
    procedure Reset;
    procedure SendCommandToIDE(S : string);
    procedure LateInitialize(VAR message: TMessage); message MSG_LateAppInit;
    procedure OpenFileInIDE(const FileName: string);    overload;
    procedure OpenFileInIDE(SearchRes: TSearchResult);  overload;
  end;

VAR
  frmMain: TfrmMain;

implementation {$R *.dfm}

USES
   ccINIFileVcl,
   ccIO,
   cWinApiIssues,
   cFindImplement,
   cFindTryExcept,
   cFindSetFocus,
   cFormatCode,
   cmINIFileQuick,
   cUTF8,
   csExecuteShell,
   csSystem,
   cFindPointerCast,
   FormColorPicker,
   FormExclude;

VAR
  CurFoundPos: Integer;
  LastLine: Integer;  { We need it for the 'Next' button }



{-------------------------------------------------------------------------------------------------------------
   CONSTRUCTOR
-------------------------------------------------------------------------------------------------------------}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //
end;


procedure TfrmMain.LateInitialize;
begin
  LoadForm(Self);
  tabOTA.TabVisible:= False;

  //edtPath.Text:= cmINIFileQuick.ReadString('Path', 'C:\Projects');
  if AppData.RunningFirstTime then
   begin
     //MesajInfo('Helps you upgrade your Delphi source code to 64 bit!');
     ExecuteURL('https://GabrielMoraru.com');
   end;

  // Settings
  ExcludedFolders:= TStringList.Create;
  LoadExcludedList(ExcludedFolders);

  // Color picker
  VAR frmClrPick: TfrmClrPick;
  AppData.CreateForm(TfrmClrPick, frmClrPick, False);
  frmClrPick.Parent:= tabColorPick;
  frmClrPick.Visible:= True;
  CenterChild(frmClrPick, tabColorPick);

  AppData.Initializing:= False;

  pgMainChange(pgMain);
  edtPathChange(nil);
end;


procedure TfrmMain.FormDestroy(Sender: TObject);
begin
 WriteString('Path', edtPath.Text);  { Save GUI }
 FreeResults;                        { Release objects }
 FreeAndNil(ExcludedFolders);
 SaveForm(Self);
end;

type
   TVBpGruppeTyp        = (vbpgNormal,vbpgAlternativ,vbpgPauschal);

procedure test;
var x: TVBpGruppeTyp;
begin
 x:=TVBpGruppeTyp(-1);
 EmptyDummy;
 MesajInfo(IntToStr(Ord(x)));
end;




{-------------------------------------------------------------------------------------------------------------
   SEARCH
-------------------------------------------------------------------------------------------------------------}

procedure TfrmMain.StartSearch(Sender: TObject);
var
   IntfName, sOutput, TextFile: string;
   Replaces: Integer;
   FoundFilesCount, FoundLines: Integer;
   FileList: TStringList;
   SearchResult: TSearchResult;
   Replace: Boolean;
const
  AutoLoadResult= False;
begin
  FreeResults;
  Reset;
  Replace:= False;
  mmoView.Clear;
  Replaces:= 0;
  FoundLines:= 0;
  FoundFilesCount:= 0;
  lblRewind.Visible:= False;
  pgBatchRepl.ActivePage:= tabStats;
  mmoView.Text := 'Processing...';
  mmoStats.Text:= 'Processing...';
  Assert((Sender as TButton).Tag > 0, 'Unknown tag!');

  Screen.Cursor:= crHourGlass;

  FileList:= ListFilesOf(edtPath.Text, edtFilter.Text, True, True, ExcludedFolders);
  try
    for TextFile in FileList do
     begin
       case (Sender as TButton).Tag of

         1: begin
              if chkIntfName.Checked
              then IntfName:= edtIntfName.Text
              else IntfName:= '';
              SearchResult:= FindImplementation(TextFile, edtMethod.Text, IntfName);
            end;
         3: begin
              Replace:= False;
              SearchResult:= FindTryExcept(TextFile, Replace); { ExecuteURL('https://GabrielMoraru.com/setfocus-is-broken-in-delphi/'); }
            end;
         4: begin
              Replace:= True;
              SearchResult:= FindTryExcept(TextFile, Replace);
            end;

         5: begin
              Replace:= False;
              SearchResult:= FindSetFocus(TextFile, Replace);
            end;
         6: begin
              Replace:= True;
              SearchResult:= FindSetFocus(TextFile, Replace);
            end;

         // BOM
         7: SearchResult:= ConvertToUTF(TextFile);  // SearchResult:= ConvertToUTF(TextFile);
         8: SearchResult:= ConvertToAnsi(TextFile);
         9: SearchResult:= IsUTF8(TextFile);

        // SendMessage
         50: SearchResult:= FindSendMessage(TextFile, 'SendMessage(');
         53: SearchResult:= FindSendMessage(TextFile, 'PostMessage(');
         51: SearchResult:= FindSendMessageCast(TextFile, false);
         52: SearchResult:= FindPerform(TextFile);

         // Replaces Pointer(Integer and Pointer(LongInt
         60: begin
               Replace:= False;
               SearchResult:= FindPointer(TextFile, Replace);
             end;
         61: begin
               Replace:= True;
               SearchResult:= FindPointer(TextFile, Replace);
             end;
         62: SearchResult:= FindPointerRelax(TextFile);

         //
         63: SearchResult:= FindLongIntCast(TextFile);

         71: SearchResult:= FindSetWindowLong(TextFile);

         // Format code tight
         80: SearchResult:= FormatCodeTight(TextFile, true);

        else MesajError('Invalid button tag!');
       end;

       if SearchResult.Found
       then
         begin
           lbxResults.AddItem(SearchResult.FileName + '        Found at: '+ SearchResult.PositionsAsString, SearchResult);
           Inc(FoundFilesCount);
           Inc(FoundLines, SearchResult.Count);

           if Replace then Replaces:= Replaces + SearchResult.Count;
         end
       else
         if chkShowAllFiles.Checked then
         begin
           // Show files that do not contain the result
           lbxResults.Items.Add('[]'+ TextFile);
           FreeAndNil(SearchResult);
         end;
     end;

    // Show statistics
    mmoStats.Text:= '';
    mmoStats.Lines.Add('');
    mmoStats.Lines.Add('Searched ' + IntToStr(FileList.Count)+ ' files.');
    mmoStats.Lines.Add('Found in ' + IntToStr(FoundFilesCount)+ ' files.');
    mmoStats.Lines.Add('   Total positions: '+ IntToStr(FoundLines));
    mmoStats.Lines.Add('Replaced: '+ IntToStr(Replaces)+ ' times.');
    mmoStats.Lines.Add('');
    Caption:= 'Done. Searched '+ IntToStr(FileList.Count)+ ' files. Found in  '+ IntToStr(FoundFilesCount)+ ' files.';

    // Click first item
    if lbxResults.Items.Count > 0 then
       begin
         lbxResults.ItemIndex:= 0;
         lbxResultsClick(Sender);
       end;
  finally
    FreeAndNil(FileList);
  end;

  Searched:= True;
  lblCurFile.Visible:= True;
  btnReset.Visible:= True;
  Screen.Cursor:= crDefault;

  { Load first result }
  if AutoLoadResult
  and (lbxResults.Items.Count > 0) then
   begin
    lbxResults.ItemIndex:= 0;
    lbxResultsDblClick(Sender);
   end;

  { Save statistics }
  if chkSaveLog.Checked then
    begin
      sOutput:= 'Results for the batch processing:'+ CRLF;
      //ToDo: don't overwrite, just append at the end (add datetime)
      for VAR s in lbxResults.Items DO
         sOutput:= sOutput+ s+ CRLF;
      StringToFile(trail(edtPath.Text)+ 'Tool Output.txt', sOutput);
    end;
end;


{-------------------------------------------------------------------------------------------------------------
   RESULTS
-------------------------------------------------------------------------------------------------------------}

{ Returns the object selected by the user }
function TfrmMain.GetSelectedSearch: TSearchResult;
begin
 Result:= lbxResults.Items.Objects[lbxResults.ItemIndex] as TSearchResult;
end;


procedure TfrmMain.FreeResults;
var i : Integer;
begin
 for i:= 0 to lbxResults.Items.Count -1 do
    FreeAndNil(lbxResults.Items.Objects[i]);          { Release list and owned objects }

 lbxResults.Clear;
end;



{-------------------------------------------------------------------------------------------------------------
   RESULTS - OPEN
-------------------------------------------------------------------------------------------------------------}

{ Show the clicked file }
procedure TfrmMain.lbxResultsClick(Sender: TObject);
begin
 pgBatchRepl.ActivePage:= tabEdit;

 if GetSelectedSearch <> NIL then
  begin
   // GUI setup
   btnNext.Visible:= GetSelectedSearch.Count > 1;
   btnPrev.Visible:= btnNext.Visible;

   // Show info
   lblCurFile.Caption:= GetSelectedSearch.FileName+ ' - '+ IntToStr(GetSelectedSearch.Count)+ 'x';

   // Load file and rewind
   mmoView.Lines.LoadFromFile(GetSelectedSearch.FileName);
   Reset;
   lblRewind.Visible:= false;

   //Scroll to first found pos
   var CurLine:= GetSelectedSearch.Positions[0].Line;
   SendMessage(mmoView.Handle, EM_LINESCROLL, 0, CurLine);

   LastLine:= CurLine;
  end;
end;


{-------------------------------------------------------------------------------------------------------------
   RESULTS - NEXT / PREV
-------------------------------------------------------------------------------------------------------------}

procedure TfrmMain.btnNextClick(Sender: TObject);
var Delta, CurLine: Integer;
begin
 if GetSelectedSearch = NIL then Exit;

 TimerRew.Enabled:= True;

 Inc(CurFoundPos);
 if CurFoundPos > High(GetSelectedSearch.Positions) then
  begin
   Reset;
   lblRewind.Left:= 10000;
   lblRewind.Visible:= true;
  end;

 CurLine:= GetSelectedSearch.Positions[CurFoundPos].Line;
 Delta:= CurLine - LastLine;
 LastLine:= CurLine;

 SendMessage(mmoView.Handle, EM_LINESCROLL, 0, Delta);
 Caption:= IntToStr(CurLine);
end;


procedure TfrmMain.btnPrevClick(Sender: TObject);
var Delta, CurLine: Integer;
begin
  TimerRew.Enabled:= True;

  Dec(CurFoundPos);
  if CurFoundPos < 0 then
   begin
    Reset;
    lblRewind.Left:= 10000;
    lblRewind.Visible:= true;
   end;

  if GetSelectedSearch <> NIL then
    begin
     CurLine:= GetSelectedSearch.Positions[CurFoundPos].Line;
     Delta:= CurLine - LastLine;
     LastLine:= CurLine;

     SendMessage(mmoView.Handle, EM_LINESCROLL, 0, Delta);
    end;
end;


{-------------------------------------------------------------------------------------------------------------
   RESULTS - OTHER / GUI
-------------------------------------------------------------------------------------------------------------}

procedure TfrmMain.TimerRewTimer(Sender: TObject);
begin
  lblRewind.Visible:= False;
  TimerRew.Enabled:= false;
end;


procedure TfrmMain.mnuCopyNameClick(Sender: TObject);
begin
  StringToClipboard(GetSelectedSearch.FileName);
end;


procedure TfrmMain.pgMainChange(Sender: TObject);
var PageCtrl: TPageControl;
begin
  if AppData.Initializing then Exit;

  PageCtrl:= Sender as TPageControl;
  if (pnlContainer.Parent <> PageCtrl.ActivePage)
  AND (
       (PageCtrl.ActivePage = tabReplace)
    or (PageCtrl.ActivePage = tabFind)
    or (PageCtrl.ActivePage = tabUTF)
    or (PageCtrl.ActivePage = tabWin64)
    or (PageCtrl.ActivePage = tabFormater) )
  then
    begin
      PageCtrl.Update;
      pnlContainer.Parent:= PageCtrl.ActivePage;
    end;
end;


procedure TfrmMain.pgMainChanging(Sender: TObject; var AllowChange: Boolean);
begin
  EmptyDummy;
end;


procedure TfrmMain.btnSaveClick(Sender: TObject);
begin
 if GetSelectedSearch <> NIL then
  begin
    ccIO.BackupFileIncrement(GetSelectedSearch.FileName, '', '.bak');
    mmoView.Lines.SaveToFile(GetSelectedSearch.FileName);
  end;
end;


procedure TfrmMain.btnResetClick(Sender: TObject);
begin
 Reset;
end;


procedure TfrmMain.Reset;
begin
  LastLine:= 0;
  CurFoundPos:= 0;
  mmoView.SelStart  := 0;     { Scroll at the top }
  mmoView.SelLength := 0;
  mmoView.Perform(EM_SCROLLCARET, 0, 0);
end;


{-------------------------------------------------------------------------------------------------------------
   SETTINGS / GUI
-------------------------------------------------------------------------------------------------------------}

procedure TfrmMain.btnExcludeClick(Sender: TObject);
var frmExclude: TfrmExclude;
begin
  AppData.CreateForm(TfrmExclude, frmExclude, False);
  try
    frmExclude.ShowModal;
    if frmExclude.modalresult = mrOk
    then ExcludedFolders.Assign(frmExclude.mmoExclude.Lines);
  finally
    frmExclude.Free;
  end;
end;


procedure TfrmMain.btnTestClick(Sender: TObject);
begin
  SendCommandToIDE(Memo1.Lines.Text);
end;


procedure TfrmMain.edtPathChange(Sender: TObject);
begin
  if AppData.Initializing then Exit;

  if DirectoryExists(edtPath.Text) then
   begin
     var Files:= ListFilesOf(edtPath.Text, edtFilter.Text, True, True);
     try
       lbxResults.Items.Assign(Files);
     finally
       FreeAndNil(files);
     end;
   end;
end;


{-------------------------------------------------------------------------------------------------------------
   OTA
--------------------------------------------------------------------------------------------------------------
   The string structure mus be like this:

   Filename=c:\My projects\Packages\CubicCommonControls\ccRegistry.pas
   Line=8
   Col=12
   Comment=(* some comment *)
-------------------------------------------------------------------------------------------------------------}

procedure TfrmMain.OpenFileInIDE(const FileName: string);
begin
  Assert(FileExistsMsg(FileName));

  var s:= 'Filename=' + FileName+ CRLF+
      'Line='+ IntToStr(1)+ CRLF+
      'Col=1'+ IntToStr(1)+ CRLF+
      'Comment=';

  SendCommandToIDE(s);
end;

procedure TfrmMain.OpenFileInIDE(SearchRes: TSearchResult);
begin
  if SearchRes = NIL then Exit;

  Assert(FileExistsMsg(SearchRes.FileName), 'File not found!'+ SearchRes.FileName);

  var s:= 'Filename=' + SearchRes.FileName+ CRLF+
      'Line='+ IntToStr(SearchRes.Positions[CurFoundPos].Line+1)+ CRLF+
      'Col='+ IntToStr(SearchRes.Positions[CurFoundPos].Column)+ CRLF+
      'Comment=';

  SendCommandToIDE(s);
end;


procedure TfrmMain.btnOpenIDEClick(Sender: TObject);
begin
  OpenFileInIDE(GetSelectedSearch);
end;


procedure TfrmMain.SendCommandToIDE(S : string);
var
  DataToSend : TCopyDataStruct;
  Receiver : HWND;
  Res : Integer;
begin
  { Prepare the data we want to send }
  DataToSend.dwData := 1;  // Registered unique ID for LighSaber apps
  DataToSend.cbData := Length(s) * SizeOf(Char);
  DataToSend.lpData := PChar(s);

  { Send }
  Receiver := WinApi.Windows.FindWindow(PWideChar('TfrmOTAReceiver'), nil);
  if Receiver = 0
  then MesajError('IDE Receiver NOT found! Please install the IDEFileReceiver.DPK first! If it doesn''t work, uninstall and reinstall the package.')
  else
    begin
      Res := SendMessage(Receiver, WM_COPYDATA, Wparam(Handle), LParam(@DataToSend));
      if Res > 0
      then //Caption := 'Succesfully sent '+IntToStr(Res)+' characters'
      else MesajError('SendMessage failed!');

      //Winapi.Windows.ShowWindow(Receiver, SW_SHOWNORMAL);
      //Winapi.Windows.SetForegroundWindow(Receiver);
    end;
end;


{ Show the clicked file in IDE }
procedure TfrmMain.lbxResultsDblClick(Sender: TObject);
begin
  if Searched
  then OpenFileInIDE(GetSelectedSearch)
  else
    if  (lbxResults.Items.Count > 0)
    and (lbxResults.ItemIndex >= 0)
    then OpenFileInIDE(lbxResults.Items[lbxResults.ItemIndex]);
end;












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







procedure TfrmMain.Button5Click(Sender: TObject);
begin
  ExecuteShell('FixEnters.exe')
end;




end.
