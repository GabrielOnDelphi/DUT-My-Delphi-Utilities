UNIT cFindTryExcept;

INTERFACE

USES
  System.SysUtils, System.Classes, cmSearchResult;


function FindTryExcept(CONST FileName: string; Replace: Boolean): TSearchResult;


IMPLEMENTATION

USES
   cmPascal, ccCore, ccIO;


CONST
   BackupFile: Boolean= FALSE; { Create backup files? }

VAR
   Counter: Integer;  { Global so we can keep incrementing the counter for ALL files }


{ Returns the line(s) where the text was found }
function FindTryExcept(CONST FileName: string; Replace: Boolean): TSearchResult;
var
   TextBody: TStringList;
   Front: string;
   sPrev, sCurrLine, NextLine, sWarnings: string;
   Save: Boolean;
   iLine: Integer;

  function ResultAfterExcept: Boolean;
  begin
    Result:= Pos('Result', Trim(NextLine))= 1;
  end;

  function AddLog: string;
  begin
    Result:= CRLF + Front+ 'DebugLog(''Exception'', ''#LogCntr '+ IntToStr(Counter) +''');'
  end;

begin
 Front := '';
 Save:= FALSE;
 sWarnings:= FileName+ CRLF+ 'Warnings' + CRLF+ CRLF;
 Result:= TSearchResult.Create;
 Result.FileName:= FileName;

 TextBody:= StringFromFileTSL(FileName);
 try
   for iLine:= 1 to TextBody.Count-2 do
     begin
       sPrev    := TextBody[iLine-1];
       sCurrLine:= TextBody[iLine];
       NextLine := TextBody[iLine+1];

       if RelaxedSearch(sCurrLine, 'except//todo')
       OR RelaxedSearch(sCurrLine, 'except') then
        begin
          // Ignore lines that start with a comment symbol:   // { (*
          if LineIsAComment(sCurrLine) then Continue;

          Result.AddNewPos(iLine, 1);                       // Returns the line(s) where the text was found

          if Replace then
           begin
             sCurrLine:= ReplaceString(sCurrLine, '//ToDo: Don''t swallow exceptions! At least log them!', '{Logged exception}');

             Inc(Counter);
             Save:= TRUE;

             { Add identation }
             VAR First:= FirstNonSpace(sCurrLine);
             if First > -1
             then Front:= System.StringOfChar(' ', First-1+2); // We put a nice number of spaces (same as Except)

             // Case 4. The code uses try/except to calculate a result of an opperation but it uses a boolean variable (B) instead of "Result"
             if RelaxedSearch(sPrev, 'b:=true;')
             then sWarnings:= sWarnings+ CRLF+ 'Use of b:=true @line'+ IntToStr(iLine);

             //Case 2. the tool always inserts the logging code if there is nothing between Except/end
             if PosInsensitive('end;', trim(NextLine)) = 1
             then sCurrLine:= sCurrLine+ AddLog
             else
               //Case 1: the tool will not insert the logging code if there is a "result:= something" line after Except
               if ResultAfterExcept
               then
                begin
                  EmptyDummy;
                  Continue;
                end
               else
                 // case 3. if there is any other code between except/and the tool does insert the logging code BUT it will write to a file so we can look manually over those cases...
                 begin
                   sCurrLine:= sCurrLine+ AddLog;
                   sWarnings:= sWarnings+ CRLF+ 'Code after except @line: '+ IntToStr(iLine);
                 end;

             { We store the information back }
             TextBody[iLine]:= sCurrLine;
           end;
        end;
     end;

   if Save and Replace then
     begin
       AddUnitToUses(TextBody, 'Unit135');
       if BackupFile
       then BackupFileBak(FileName);
       StringToFile(FileName, TextBody.Text, woOverwrite, TRUE);
       StringToFile(ForceExtension(FileName, '.txt'), sWarnings, woOverwrite);
     end;

 finally
   FreeAndNil(TextBody);
 end;
end;


end.
