unit FormResults;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  cmSearchResult, Vcl.Menus;

type
  TfrmResults = class(TForm)
    Container   : TPanel;
    splResults  : TSplitter;
    PopupMenu   : TPopupMenu;
    mnuCopyName : TMenuItem;
    mnuOpen     : TMenuItem;
    pnlFiles1   : TPanel;
    lbxResults  : TListBox;
    splVertical : TSplitter;
    mmoStats    : TMemo;
    procedure FormCreate         (Sender: TObject);
    procedure FormDestroy        (Sender: TObject);
    procedure lbxResultsClick    (Sender: TObject);
    procedure lbxResultsDblClick (Sender: TObject);
    procedure mnuCopyNameClick   (Sender: TObject);
    procedure mnuOpenClick       (Sender: TObject);
    procedure FormKeyPress       (Sender: TObject; var Key: Char);
  private
    Searched: Boolean;
    procedure ShowEditor;
    procedure SaveStatistics;
    procedure LoadCurFile;
  public
    procedure Reset;
    procedure LoadFirstResult;
    function  GetSelectedSearch: TSearchResult;
    procedure ShowResultsForm;
    procedure HideEditor;
  end;

var
  frmResults: TfrmResults;

implementation {$R *.dfm}

USES
   ccCore, ccIO, ccTextFile, cbAppData, cbIniFile, csSystem, csExecuteShell,
   FormOTA, FormEditor, FormOptions, FormExplorer, MainForm;



procedure TfrmResults.FormCreate(Sender: TObject);
begin
  LoadForm(Self);
  HideEditor;
end;


procedure TfrmResults.FormDestroy(Sender: TObject);
begin
  SaveForm(Self);
end;




{-------------------------------------------------------------------------------------------------------------
   FORM
-------------------------------------------------------------------------------------------------------------}
procedure TfrmResults.Reset;
begin
  lbxResults.Clear;
  mmoStats.Text:= '';
  mmoStats.Visible:= False;
  mmoStats.Text:= 'Processing...';
  Caption:= 'Processing...';
  HideEditor;
end;


{ Make the PAS Editor visible and anchor it properly }
procedure TfrmResults.ShowEditor;
begin
  splResults.Visible:= True;
  //Container.Align:= alTop;
  //Container.Height:= 200;
  //splResults.Top:= pnlTop.Top+ pnlTop.Height {lblCurFile.Height};

  frmEditor.Container.Parent:= Container;
  frmEditor.Container.Align:= alClient;
  frmEditor.Container.Top:= 9999;

  mmoStats.Visible:= True;
  splVertical.Left:= lbxResults.Width;
end;


procedure TfrmResults.HideEditor;
begin
  Container.Align:= alClient;
  splResults.Visible:= False;

  frmEditor.Container.Parent:= frmEditor;
  frmEditor.ResetViewer;
end;


procedure TfrmResults.LoadFirstResult;
begin
  Searched:= True;
  ShowResultsForm; // Must be above LoadCurFile, because it calls Reset

  if lbxResults.Items.Count > 0
  then
    begin
      lbxResults.ItemIndex:= 0;   // Mark the first item as "current"
      LoadCurFile;                // Load the current file
      SaveStatistics;
    end
  else
     Caption:= 'No issues found.';
end;


procedure TfrmResults.ShowResultsForm;
begin
  if frmOptions.chkNewWnd.Checked
  then Show               // Show as undocked
  else                    // Show as docked
    begin
      Container.Parent:= frmMain.CardPanel.ActiveCard;
      Top:= 9999;
      //Container.Align:= alClient;
    end;
end;


procedure TfrmResults.SaveStatistics;
begin
  if frmOptions.chkSaveStats.Checked then
    begin
      var sOutput:= 'Results for the batch processing:'+ CRLF;
      //ToDo: don't overwrite, just append at the end (add datetime)
      for VAR s in frmResults.lbxResults.Items DO
         sOutput:= sOutput+ s+ CRLF;
      StringToFile(Trail(frmExplorer.edtPath.Text)+ 'Tool Output.txt', sOutput);
    end;
end;



{-------------------------------------------------------------------------------------------------------------
   RESULTS
-------------------------------------------------------------------------------------------------------------}

{ Returns the object selected by the user }
function TfrmResults.GetSelectedSearch: TSearchResult;
begin
  Result:= lbxResults.Items.Objects[frmResults.lbxResults.ItemIndex] as TSearchResult;
end;


{ Load the clicked file }
procedure TfrmResults.LoadCurFile;
begin
  if Searched
  then
    if GetSelectedSearch = NIL
    then
    else
      begin
        ShowEditor;    // Make the PAS Editor visible. Must be above frmEditor.LoadSearchRes
        frmEditor.LoadSearchRes(GetSelectedSearch);
        Caption:= GetSelectedSearch.FileName;
      end
  else
    if  (lbxResults.Items.Count > 0)
    and (lbxResults.ItemIndex >= 0)
    then
      begin
        ShowEditor;    // Make the PAS Editor visible. Must be above frmEditor.LoadFile
        frmEditor.LoadFileRaw(lbxResults.Items[lbxResults.ItemIndex]);
        Caption:= lbxResults.Items[lbxResults.ItemIndex];
      end
end;

procedure TfrmResults.lbxResultsClick(Sender: TObject);
begin
  LoadCurFile;
end;


{ Show the clicked file in Delphi IDE }
procedure TfrmResults.lbxResultsDblClick(Sender: TObject);
begin
  if Searched
  then
    if GetSelectedSearch <> NIL
    then OpenFileInIDE(GetSelectedSearch, frmEditor.SearchRecPos)
    else
  else
    if  (lbxResults.Items.Count > 0)
    and (lbxResults.ItemIndex >= 0)
    then OpenFileInIDE(lbxResults.Items[lbxResults.ItemIndex]);

  ShowEditor;
end;






{-------------------------------------------------------------------------------------------------------------
   MENU
-------------------------------------------------------------------------------------------------------------}
procedure TfrmResults.mnuCopyNameClick(Sender: TObject);
begin
  StringToClipboard(GetSelectedSearch.FileName);
end;

procedure TfrmResults.mnuOpenClick(Sender: TObject);
begin
  ExecuteShell(GetSelectedSearch.FileName)
end;



procedure TfrmResults.FormKeyPress(Sender: TObject; var Key: Char);
begin
  {KeyDown event is less safer. If the form has a drop down controls with event assigned then form will close before the actual control finishes his drop-down behavior (like lookup combobox for example). Also if the form has caFree set on Close and combobox has OnCloseUp event you could get an AV because the form is closed before the combobox closeup event is called!
  https://stackoverflow.com/questions/41940049/onkeypress-for-escape-closes-form-by-default }
  if Ord(key) = vk_Escape then Close;
  Assert(KeyPreview, 'In order to close with Esc we need to activate KeyPreview!');
end;

end.
