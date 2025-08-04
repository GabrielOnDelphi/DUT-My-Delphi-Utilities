unit FormOptions;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, LightVcl.Common.AppDataForm, Vcl.StdCtrls;

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
   LightCore.AppData, LightVcl.Common.AppData
, LightVcl.Visual.INIFile;


procedure TfrmOptions.FormCreate(Sender: TObject);
begin
  //LoadForm(Self);
end;


procedure TfrmOptions.FormDestroy(Sender: TObject);
begin
  ////SaveForm(Self); called by AppData
end;

end.
