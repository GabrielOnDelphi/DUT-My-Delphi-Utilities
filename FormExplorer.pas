unit FormExplorer;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  cbAppData;

type
  TfrmExplorer = class(TForm)
    Container: TPanel;
    edtFilter: TLabeledEdit;
    edtPath: TLabeledEdit;
    btnExclude: TButton;
    procedure FormDestroy        (Sender: TObject);
    procedure btnExcludeClick    (Sender: TObject);
    procedure edtPathChange      (Sender: TObject);
  public
  end;

var
  frmExplorer: TfrmExplorer;

implementation {$R *.dfm}

USES
   ccIO, ccTextFile, cbIniFile, cmINIFileQuick, FormExclude, FormResults;


procedure TfrmExplorer.FormDestroy(Sender: TObject);
begin
  WriteString('Path', edtPath.Text);  { Save GUI }
  SaveForm(Self, flLoad);
end;


procedure TfrmExplorer.edtPathChange(Sender: TObject);
begin
  if AppData.Initializing then Exit;

  if DirectoryExists(edtPath.Text) then
  // AND frmResults.Visible
   begin
     var Files:= ListFilesOf(edtPath.Text, edtFilter.Text, True, True);
     try
       frmResults.lbxResults.Items.Assign(Files);
     finally
       FreeAndNil(files);
     end;
   end;
end;



{-------------------------------------------------------------------------------------------------------------
   EXCLUDE
-------------------------------------------------------------------------------------------------------------}

procedure TfrmExplorer.btnExcludeClick(Sender: TObject);
begin
  frmExclude.show;
end;

end.
