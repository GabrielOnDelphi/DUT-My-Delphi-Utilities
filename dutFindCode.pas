UNIT dutFindCode;

{=============================================================================================================
   Gabriel Moraru
   2025.01
   See Copyright.txt
--------------------------------------------------------------------------------------------------------------
   Find Delphi code
-------------------------------------------------------------------------------------------------------------}

INTERFACE

USES
  System.SysUtils, System.Classes, System.Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  cmSearchResult, dutUpgradeCode, dutBase;


TYPE
  TfrmSettingsFindCode = class(TForm)
    Container: TPanel;
    edtText: TLabeledEdit;
    Label1: TLabel;
  private
  public
  end;

TYPE
  TAgent_FindCode = class(TBaseAgent)
  private
    FormSettings: TfrmSettingsFindCode;
  public
    constructor Create(BackupFile: Boolean); override;
    destructor Destroy; override;

    procedure Execute(const FileName: string); override;
    class function Description: string; override;
    class function CanReplace: Boolean; override;
    procedure DockSettingsForm(HostPanel: TPanel); override;
  end;



IMPLEMENTATION {$R *.dfm}
USES
   ccTextFile, ccIO, cmPascal, ccCore;



constructor TAgent_FindCode.Create(BackupFile: Boolean);
begin
  inherited;
  FormSettings:= TfrmSettingsFindCode.Create(NIL); //Freed by: HostPanel
end;


//ToDo: add support to search multiple strings sepparated by [OR] as in google.
procedure TAgent_FindCode.Execute(const FileName: string);
var
   sLine: string;
   iLine: Integer;
begin
  inherited Execute(FileName);

  Needle:= FormSettings.edtText.Text;

  if NOT CaseSensitive
  then Needle:= LowerCase(Needle);

  for iLine:= 0 to TextBody.Count-1 do
    begin
      sLine:= LowerCase(TextBody[iLine]);
      var iColumn:= Pos(Needle, sLine);
      if iColumn > 0
      then SearchResults.Last.AddNewPos(iLine, iColumn, sLine);
    end;

  Finalize; // Increment counters
end;


class function TAgent_FindCode.Description: string;
begin
  Result:= 'Find all files containing the specified text.'+ CRLF+
           ' and outputs the lines to screen.';
end;


class function TAgent_FindCode.CanReplace: Boolean;
begin
  Result:= FALSE;
end;




{ FORM }
procedure TAgent_FindCode.DockSettingsForm(HostPanel: TPanel);
begin
  FormSettings.Container.Parent:= HostPanel;
end;


destructor TAgent_FindCode.Destroy;
begin
  FreeAndNil(FormSettings);
  inherited;
end;


end.
