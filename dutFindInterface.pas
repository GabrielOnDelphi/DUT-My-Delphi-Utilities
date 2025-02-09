UNIT dutFindInterface;

{=============================================================================================================
   Gabriel Moraru
   2025.01
   See Copyright.txt
--------------------------------------------------------------------------------------------------------------
   FIND INTERFACE IMPLEMENTATION

   Finds the class(es) that implement the specified method
-------------------------------------------------------------------------------------------------------------}

INTERFACE

USES
  System.SysUtils, System.Classes, System.Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  cmSearchResult, dutUpgradeCode, dutBase;


TYPE
  TfrmSettingsIntf = class(TForm)
    Container: TPanel;
    edtMethod: TLabeledEdit;
    chkIntfName: TCheckBox;
    edtIntfName: TEdit;
  public
  end;


TYPE
  TAgent_FindInterface = class(TBaseAgent)
  private
    MethodToFind: string;
    InterfaceName: string;
    //FIsInterfaceNameChecked: Boolean;
    FormSettings: TfrmSettingsIntf;
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


constructor TAgent_FindInterface.Create(BackupFile: Boolean);
begin
  inherited;
  FormSettings:= TfrmSettingsIntf.Create(NIL); //Freed by: HostPanel
end;


procedure TAgent_FindInterface.Execute(const FileName: string);
var
   sLine: string;
   iColumn, iLine: Integer;


  function FindMethod(const RoutineType: string): Boolean;
  var iPos2, iPos3: Integer;
  begin
   Result:= False;
   iColumn:= PosInsensitive(RoutineType, sLine);
   if iColumn > 0 then
    begin
       iPos2:= PosInsensitive('.'+ MethodToFind+ '(', sLine);  // Search only full words
       iPos3:= PosInsensitive('.'+ MethodToFind+ ';', sLine);  // Search only full words

       const x= iColumn+ Length(RoutineType)+ 3;

       if (iPos2 > x) or (iPos3 > x)
       then Result:= True;   // Returns the line(s) where the text was found
    end;
  end;

  function FindInterface: Boolean;
  begin
     if InterfaceName = ''
     then Exit(True)
     else Result:= False;

     var UpPoint:= Min(0, iLine-100);
     for var j:= iLine downto UpPoint do
       if (PosInsensitive(',' + InterfaceName, TextBody[j]) > 7)
       or (PosInsensitive(', '+ InterfaceName, TextBody[j]) > 7)
       then Exit(True);
  end;

begin
  inherited Execute(FileName);

  MethodToFind            := FormSettings.edtMethod.Text;
  InterfaceName           := FormSettings.edtIntfName.Text;
  //FIsInterfaceNameChecked := FormSettings.chkIntfName.Checked;

  for iLine:= 0 to TextBody.Count-1 do
    begin
      sLine:= TextBody[iLine];
      if not LineIsAComment(sLine) then    // Ignore lines that start with a comment symbol:   // { (*
       begin
         // ToDo: let user choose if he wants to search for a function or a procedure
         if FindMethod('procedure T')     // c
         and FindInterface
         then SearchResults.Last.AddNewPos(iLine, iColumn, sLine);

         if FindMethod('function T')      // c
         and FindInterface
         then SearchResults.Last.AddNewPos(iLine, iColumn, sLine);
       end;
    end;

  Finalize; // Increment counters
end;


class function TAgent_FindInterface.Description: string;
begin
  Result:= 'Finds the classes that implement the specified method.';
end;


class function TAgent_FindInterface.CanReplace: Boolean;
begin
  Result:= FALSE;
end;







{ FORM }
procedure TAgent_FindInterface.DockSettingsForm(HostPanel: TPanel);
begin
  FormSettings.Container.Parent:= HostPanel;
end;


destructor TAgent_FindInterface.Destroy;
begin
  FreeAndNil(FormSettings);
  inherited;
end;


end.
