unit cUTF8;

{=============================================================================================================
   Gabriel Moraru
   2022
--------------------------------------------------------------------------------------------------------------
   Convert between ANSI and UTF8

   Wikipedia:
   The UTF-8 representation of the BOM is the (hexadecimal) byte sequence EF BB BF .
   The Unicode Standard permits the BOM in UTF-8, but does not require or recommend its use.

   Tester app:
      c:\My projects\Project support\DUT2\DUT2.dpr
=============================================================================================================}

interface

uses
  cmSearchResult;


function IsUTF8       (CONST FileName: string): TSearchResult;
function ConvertToUTF (const FileName: string): TSearchResult;
function ConvertToAnsi(CONST FileName: string): TSearchResult;



IMPLEMENTATION
USES
   cmUTF8, ccIO;



{-------------------------------------------------------------------------------------------------------------
   IsUTF8?
-------------------------------------------------------------------------------------------------------------}

function IsUTF8(const FileName: string): TSearchResult;
begin
  Result := TSearchResult.Create;
  Result.FileName := FileName;

  if cmUTF8.IsUTF8(FileName)
  then Result.AddNewPos(1, 1);         // We indicate that this file was found without BOM
end;





{-------------------------------------------------------------------------------------------------------------
   CONVERT
-------------------------------------------------------------------------------------------------------------}

function ConvertToUTF(const FileName: string): TSearchResult;
begin
 Result:= TSearchResult.Create;
 Result.FileName:= FileName;

 if not cmUTF8.IsUTF8(FileName) then
   begin
     VAR s:= StringFromFile(FileName, nil);
     StringToFile(FileName, s, woOverwrite, TRUE);
     Result.AddNewPos(1,1);
   end;
end;


function ConvertToAnsi(CONST FileName: string): TSearchResult;
begin
  Result:= TSearchResult.Create;
  Result.FileName:= FileName;
  if cmUTF8.ConvertToAnsi(FileName) then
   begin
    Result.AddNewPos(1,1);
   end;
end;


end.
