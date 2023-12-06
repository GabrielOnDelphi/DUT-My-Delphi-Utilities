UNIT cFindImplement;

INTERFACE

USES
  System.Math, System.SysUtils, System.Classes, cmSearchResult;


function FindImplementation(CONST FileName, MethodToFind, IntfName: string): TSearchResult;


IMPLEMENTATION

USES
   cmPascal, ccCore, ccIO;


{ Finds the class(es) that implement the specified method }
function FindImplementation(CONST FileName, MethodToFind, IntfName: string): TSearchResult;
var
   TextBody: TStringList;
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
          if IntfName = ''
          then Exit(True)
          else Result:= False;

          var UpPoint:= Min(0, iLine-100);
          for var j:= iLine downto UpPoint do
            if (PosInsensitive(',' + IntfName, TextBody[j]) > 7)
            or (PosInsensitive(', '+ IntfName, TextBody[j]) > 7)
            then Exit(True);
       end;
begin
 Result:= TSearchResult.Create;
 Result.FileName:= FileName;

 TextBody:= StringFromFileTSL(FileName);
 try
   for iLine:= 0 to TextBody.Count-1 do
     begin
       sLine:= TextBody[iLine];
       if not LineIsAComment(sLine) then    // Ignore lines that start with a comment symbol:   // { (*
        begin
          // ToDo: let user choose if he wants to search for a function or a procedure
          if FindMethod('procedure T')
          and FindInterface then Result.AddNewPos(iLine, iColumn);
          if FindMethod('function T')
          and FindInterface then Result.AddNewPos(iLine, iColumn);
        end;
     end;
 finally
   FreeAndNil(TextBody);
 end;
end;


end.
