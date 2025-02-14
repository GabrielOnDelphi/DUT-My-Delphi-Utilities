program LDU;

uses
  FastMM4,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  cbAppData in '..\..\LightSaber\cbAppData.pas',
  MainForm in 'MainForm.pas' {frmMain},
  FormExclude in 'FormExclude.pas' {frmExclude},
  FormColorPicker in 'FormColorPicker.pas',
  FormAgent in 'FormAgent.pas' {frmAgentResults},
  FormOTA in 'FormOTA.pas' {frmOTA},
  FormEditor in 'FormEditor.pas' {frmEditor},
  FormOptions in 'FormOptions.pas' {frmOptions},
  cmPascal in '..\..\LightSaber\cmPascal.pas',
  cmSearchResult in '..\..\LightSaber\cmSearchResult.pas',
  dutBase in 'dutBase.pas',
  dutCodeFormat in 'dutCodeFormat.pas',
  dutUpgradeCode in 'dutUpgradeCode.pas',
  dutWin64Extended in 'dutWin64Extended.pas',
  dutAgentFactory in 'dutAgentFactory.pas',
  dutWin64Api in 'dutWin64Api.pas',
  dutWin64Pointer in 'dutWin64Pointer.pas',
  dutFindCode in 'dutFindCode.pas' {frmSettingsFindCode},
  dutFindInterface in 'dutFindInterface.pas' {frmSettingsIntf},
  dutBom in 'dutBom.pas';

{$R *.res}

begin
  AppData:= TAppData.Create('LUD - Light Delphi Utilities');
  AppData.CreateMainForm(TfrmMain, frmMain, True);
  AppData.Run;
end.
