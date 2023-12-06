UNIT cWinApiIssues;
{ Porting code to 64 bit }

INTERFACE

USES
  System.SysUtils, System.Classes, cmSearchResult;

function FindSendMessage    (CONST FileName, Needle: string): TSearchResult;
function FindSendMessageCast(CONST FileName: string; Replace: Boolean): TSearchResult;
function FindPerform        (CONST FileName: string): TSearchResult;
function FindSetWindowLong  (CONST FileName: string): TSearchResult;


IMPLEMENTATION

USES
   cmPascal, ccCore, ccIO;

{
  Looks for files where we have SendMessage().
  Returns the line(s) where the text was found.
  If the line contains the "WPARAM" and "LPARAM" keywords, it is ignored (because it is valid).
  Same, if the parameters are 0,0.
  This could give lots of false positive results, but it is still useful to search for possible invalid code.
}
function FindSendMessage(CONST FileName, Needle: string): TSearchResult;
var
   TextBody: TStringList;
   sLine: string;
   Found: Boolean;
   iColumn, iPos2, iPos3, iLine: Integer;
begin
 Result:= TSearchResult.Create;
 Result.FileName:= FileName;

 TextBody:= StringFromFileTSL(FileName);
 try
   for iLine:= 0 to TextBody.Count-1 do
     begin
       sLine:= TextBody[iLine];
       if LineIsAComment(sLine) then Continue;   // Ignore lines that start with a comment symbol:   // { (*

       iColumn:= PosInsensitive(Needle, sLine);
       if iColumn > 0 then
        begin
          // We ignore cases where the WParam/LParam are 0.
          // Ex: SendMessage(Handle,CM_Exit,0,0);
          if Pos('0,0)' , sLine, iColumn) > 1 then Continue;
          if Pos('0, 0)', sLine, iColumn) > 1 then Continue;

          iPos2:= PosInsensitive('WPARAM', sLine);
          iPos3:= PosInsensitive('LPARAM', sLine);

          Found:= (iPos2 < 1) or (iPos3 < 1);
          if Found then Result.AddNewPos(iLine, iColumn);


        end;
     end;
 finally
   FreeAndNil(TextBody);
 end;
end;



{
  Looks for files where we have SendMessage() and invalid typecasts are found.
  We look especially for things like:
     SendMessage(hWnd, WM_SETTEXT, 0, Integer(@MyCharArray));
     SendMessage(hWnd, WM_SETTEXT, 0, LongInt(@MyCharArray));
}
function FindSendMessageCast(CONST FileName: string; Replace: Boolean): TSearchResult;
var
   TextBody: TStringList;
   sLine: string;
   Found: Boolean;
   iColumn, iLine: Integer;
begin
 Result:= TSearchResult.Create;
 Result.FileName:= FileName;

 TextBody:= StringFromFileTSL(FileName);
 try
   for iLine:= 0 to TextBody.Count-1 do
     begin
       sLine:= TextBody[iLine];
       //if LineIsAComment(sLine) then Continue;   // Ignore lines that start with a comment symbol:   // { (*

       iColumn:= PosInsensitive('SendMessage(', sLine);
       if iColumn > 0 then
        begin
          Found:=
             (PosInsensitive('LongInt(' , sLine) > iColumn) or
             (PosInsensitive('Integer(' , sLine) > iColumn) or
             (PosInsensitive('Cardinal(', sLine) > iColumn) or
             (PosInsensitive('SmallInt(', sLine) > iColumn) or
             (PosInsensitive('Word('    , sLine) > iColumn) or
             (PosInsensitive('Byte('    , sLine) > iColumn);

          if Found then Result.AddNewPos(iLine, iColumn);
        end;
     end;
 finally
   FreeAndNil(TextBody);
 end;
end;


function FindPerform(CONST FileName: string): TSearchResult;
var
   TextBody: TStringList;
   sLine: string;
   iColumn, iLine: Integer;
begin
 Result:= TSearchResult.Create;
 Result.FileName:= FileName;

 TextBody:= StringFromFileTSL(FileName);
 try
   for iLine:= 0 to TextBody.Count-1 do
     begin
       sLine:= TextBody[iLine];

       iColumn:= PosInsensitive('.Perform(', sLine); //Example: TForm(Parent.Owner).Perform(CM_FOCUSCHANGED,0,Longint(Self));
       if iColumn > 0
       then Result.AddNewPos(iLine, iColumn);
     end;
 finally
   FreeAndNil(TextBody);
 end;
end;



function FindSetWindowLong(CONST FileName: string): TSearchResult;
var
   TextBody: TStringList;
   sLine: string;
   iLine: Integer;
begin
  Result:= TSearchResult.Create;
  Result.FileName:= FileName;

  TextBody:= StringFromFileTSL(FileName);
  try
    for iLine:= 0 to TextBody.Count-1 do
      begin
        sLine:= TextBody[iLine];
        var iColumn:= PosInsensitive('etWindowLong(', sLine);   // Search for SetWindowLong and GetWindowLong
        if iColumn > 0
        then Result.AddNewPos(iLine, iColumn);
      end;

  finally
    FreeAndNil(TextBody);
  end;
end;


end.
