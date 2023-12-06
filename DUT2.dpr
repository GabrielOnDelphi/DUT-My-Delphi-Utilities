program DUT2;

uses
  FastMM4,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  uMainForm in 'uMainForm.pas' {frmMain},
  cFindImplement in 'cFindImplement.pas',
  FormExclude in 'FormExclude.pas' {frmExclude},
  cWinApiIssues in 'cWinApiIssues.pas',
  cFindTryExcept in 'cFindTryExcept.pas',
  cFindSetFocus in 'cFindSetFocus.pas',
  FormColorPicker in 'FormColorPicker.pas',
  cFindPointerCast in 'cFindPointerCast.pas',
  cFormatCode in 'cFormatCode.pas',
  cUTF8 in 'cUTF8.pas',
  cmUTF8 in '..\..\Packages\LightSaber\cmUTF8.pas',
  ccAppData in '..\..\Packages\LightSaber\ccAppData.pas';

{$R *.res}

begin
  Application.Initialize;
  AppData:= TAppData.Create('DUT2');
  AppData.CreateMainForm(TfrmMain, frmMain, true);
  Application.Run;
end.







