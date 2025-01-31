unit FormExclude;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, cbAppDataForm,Vcl.StdCtrls;

type
  TfrmExclude = class(TLightForm)
    mmoExclude: TMemo;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    function excludedFiles: String;
  end;

var
   frmExclude: TfrmExclude;


implementation {$R *.dfm}

uses
   cbAppData, cvINIFile;


function TfrmExclude.excludedFiles: string;
begin
  Result:= AppData.AppDataFolder(True)+ 'ExcludedFiles.txt'
end;

procedure TfrmExclude.FormCreate(Sender: TObject);
begin
  //LoadForm(Self);
  if FileExists(excludedFiles)
  then mmoExclude.Lines.LoadFromFile(excludedFiles);;
end;


procedure TfrmExclude.FormDestroy(Sender: TObject);
begin
  //SaveForm(Self);
  mmoExclude.Lines.SaveToFile(excludedFiles);
end;


end.
