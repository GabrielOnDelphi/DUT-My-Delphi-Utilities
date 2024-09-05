program LDU;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  MainForm in 'MainForm.pas' {frmMain},
  FormExclude in 'FormExclude.pas' {frmExclude},
  FormColorPicker in 'FormColorPicker.pas',
  FormResults in 'FormResults.pas' {frmResults},
  FormOTA in 'FormOTA.pas' {frmOTA},
  FormEditor in 'FormEditor.pas' {frmEditor},
  FormExplorer in 'FormExplorer.pas',
  FormOptions in 'FormOptions.pas' {frmOptions},
  dutBase in '..\..\Packages\LightSaber\dutBase.pas',
  dutCodeUtils in '..\..\Packages\LightSaber\dutCodeUtils.pas',
  dutUpgradeCode in '..\..\Packages\LightSaber\dutUpgradeCode.pas',
  dutWin64 in '..\..\Packages\LightSaber\dutWin64.pas',
  cmPascal in '..\..\Packages\LightSaber\cmPascal.pas',
  cmSearchResult in '..\..\Packages\LightSaber\cmSearchResult.pas',
  cbAppData in '..\..\Packages\LightSaber\cbAppData.pas',
  cmUTF8 in '..\..\Packages\LightSaber\cmUTF8.pas';

{$R *.res}

begin
  AppData:= TAppData.Create('DUT_2');
  AppData.CreateMainForm(TfrmMain, frmMain, true);
  Application.Run;
end.







