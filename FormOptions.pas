unit FormOptions;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls;

type
  TfrmOptions = class(TForm)
    chkShowAllFiles: TCheckBox;
    chkBackup: TCheckBox;
    chkNewWnd: TCheckBox;
    chkSaveStats: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  public
  end;

var
  frmOptions: TfrmOptions;

implementation {$R *.dfm}

uses
   cbAppData, cvINIFile;


procedure TfrmOptions.FormCreate(Sender: TObject);
begin
  LoadForm(Self);
end;


procedure TfrmOptions.FormDestroy(Sender: TObject);
begin
  SaveForm(Self);
end;

end.
