unit FormOptions;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, cbAppDataForm, Vcl.StdCtrls;

type
  TfrmOptions = class(TLightForm)
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
   ccAppData, cbAppDataVCL
, cvINIFile;


procedure TfrmOptions.FormCreate(Sender: TObject);
begin
  //LoadForm(Self);
end;


procedure TfrmOptions.FormDestroy(Sender: TObject);
begin
  ////SaveForm(Self); called by AppData
end;

end.
