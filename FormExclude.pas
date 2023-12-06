unit FormExclude;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls;

type
  TfrmExclude = class(TForm)
    btnOK: TButton;
    mmoExclude: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  end;


procedure LoadExcludedList(ExcludedFolders: TStrings);
function ExcludedFile: string;


implementation {$R *.dfm}

uses
   ccAppData, ccINIFileVcl;


procedure TfrmExclude.FormCreate(Sender: TObject);
begin
  LoadForm(Self);
  LoadExcludedList(mmoExclude.Lines);
end;


procedure TfrmExclude.FormDestroy(Sender: TObject);
begin
  SaveForm(Self);
  mmoExclude.Lines.SaveToFile(ExcludedFile);
end;


procedure LoadExcludedList(ExcludedFolders: TStrings);
begin
  if FileExists(ExcludedFile)
  then ExcludedFolders.LoadFromFile(ExcludedFile);
end;


function ExcludedFile: string;
begin
  Result:= AppData.AppDataFolder(True)+ 'ExcludedFiles.txt'
end;

end.
