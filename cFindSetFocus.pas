unit cFindSetFocus;
{ Fix problems with Embarcadero's SetFocus.
  See also: uUtilsFocus.pas }

interface

uses
  System.SysUtils, System.Classes, cmSearchResult;


function FindSetFocus(CONST FileName: string; Replace: Boolean): TSearchResult;


IMPLEMENTATION

USES cmPascal, ccCore, ccIO;


CONST
   BackupFile: Boolean= FALSE; { Create backup files? }


{ Returns the line(s) where the text was found }
function FindSetFocus(CONST FileName: string; Replace: Boolean): TSearchResult;
var
   TextBody: TStringList;
   Front: string;
   sLine: string;
   Found: Boolean;
   iPos, i: Integer;
begin
 Front := '';
 Found:= FALSE;
 Result:= TSearchResult.Create;
 Result.FileName:= FileName;

 TextBody:= StringFromFileTSL(FileName);
 try
   for i:= 0 to TextBody.Count-1 do
     begin
       sLine:= TextBody[i];
       iPos:= PosInsensitive('.SetFocus;', sLine);   // We search for something like: Edit2.SetFocus;
       if iPos > 0 then
        begin
          // Ignore lines that start with a comment symbol:   // { (*
          if LineIsAComment(sLine) then Continue;

          Result.AddNewPos(i, iPos);                       // Returns the line(s) where the text was found

          if Replace then
           begin
             { Restore spaces }
             VAR First:= FirstNonSpace(sLine);
             if First > -1
             then Front:= System.StringOfChar(' ', First-1);

             // SetFocus() can be found in cmVclUtils.pas
             TextBody[i]:= Front+ 'uUtilsFocus.SetFocus('+ ExtractObjectName(sLine)+ ');';  // We write something like SetFocus(Edit2);
             Found:= TRUE;
           end;
        end;
     end;

   if Found and Replace then
     begin
       AddUnitToUses(TextBody, 'uUtilsFocus, ');
       if BackupFile
       then BackupFileBak(FileName);
       StringToFile(FileName, TextBody.Text, woOverwrite, TRUE);
     end;

 finally
   FreeAndNil(TextBody);
 end;
end;


end.
