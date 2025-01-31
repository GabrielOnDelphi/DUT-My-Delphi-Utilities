program LDU;

uses
  FastMM4,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  MainForm in 'MainForm.pas' {frmMain},
  FormExclude in 'FormExclude.pas' {frmExclude},
  FormColorPicker in 'FormColorPicker.pas',
  FormAgent in 'FormAgent.pas' {frmAgentResults},
  FormOTA in 'FormOTA.pas' {frmOTA},
  FormEditor in 'FormEditor.pas' {frmEditor},
  FormOptions in 'FormOptions.pas' {frmOptions},
  cmPascal in '..\..\LightSaber\cmPascal.pas',
  cmSearchResult in '..\..\LightSaber\cmSearchResult.pas',
  cbAppData in '..\..\LightSaber\cbAppData.pas',
  dutBase in 'dutBase.pas',
  dutCodeUtils in 'dutCodeUtils.pas',
  dutUpgradeCode in 'dutUpgradeCode.pas',
  dutWin64Extended in 'dutWin64Extended.pas',
  dutAgentFactory in 'dutAgentFactory.pas',
  dutWin64Api in 'dutWin64Api.pas',
  dutWin64Pointer in 'dutWin64Pointer.pas',
  dutCodeUtilsForm in 'dutCodeUtilsForm.pas' {frmIntfImpl};

{$R *.res}

begin
  AppData:= TAppData.Create('LightSaber LDU');
  AppData.CreateMainForm(TfrmMain, frmMain, true);
  Application.CreateForm(TfrmIntfImpl, frmIntfImpl);
  Application.Run;
end.
