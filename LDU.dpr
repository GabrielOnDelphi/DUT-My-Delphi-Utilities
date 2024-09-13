﻿program LDU;

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
  dutBase in '..\..\LightSaber\dutBase.pas',
  dutCodeUtils in '..\..\LightSaber\dutCodeUtils.pas',
  dutUpgradeCode in '..\..\LightSaber\dutUpgradeCode.pas',
  dutWin64 in '..\..\LightSaber\dutWin64.pas',
  cmPascal in '..\..\LightSaber\cmPascal.pas',
  cmSearchResult in '..\..\LightSaber\cmSearchResult.pas',
  cbAppData in '..\..\LightSaber\cbAppData.pas',
  cmUTF8 in '..\..\LightSaber\cmUTF8.pas';

{$R *.res}

begin
  AppData:= TAppData.Create('DUT_2');
  AppData.CreateMainForm(TfrmMain, frmMain, true);
  Application.Run;
end.







