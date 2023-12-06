UNIT cFindPointerCast;
{ Porting code to 64 bit }

{ToDo: implement this check:
    if Pos('Move(') > 0 and (*4 found) or (SizeOf found) then Found:= true;

    Explanation:
       Correct:
       Move(FSelection[Index + 1], FSelection[Index], (FSelectionCount - Index - 1) * SizeOf(Pointer));

       Wrong:
       Move(FSelection[Index + 1], FSelection[Index], (FSelectionCount - Index - 1) * 4);}

{ToDo: Check all GetRec SetRec to see if they return LongInt, or receive LongInt as param.}

INTERFACE

USES
  System.SysUtils, System.Classes, cmSearchResult;


function FindPointer     (CONST FileName: string; Replace: Boolean): TSearchResult;
function FindPointerRelax(CONST FileName: string): TSearchResult;
function FindLongIntCast (CONST FileName: string; RelaxedSearch: Boolean= True): TSearchResult;


IMPLEMENTATION

USES
   ccCore, ccIO;


CONST
   BackupFile: Boolean= True; { Create backup files? }


{ Replaces Pointer(Integer and Pointer(LongInt.
  Emba manual: You cannot assume that SizeOf(Pointer)=SizeOf(Integer/Cardinal/Longint) }

function FindPointer(CONST FileName: string; Replace: Boolean): TSearchResult;
var
   TextBody: TStringList;
   sLine: string;
   Found: Boolean;
   iLine: Integer;

   procedure Find(const Offender, Fix: string);
   begin
       var iColumn:= PosInsensitive(Offender, sLine);
       if iColumn < 1 then Exit;

       Found:= True;
       Result.AddNewPos(iLine, iColumn);

       if Replace then
        begin
         sLine:= ReplaceString(sLine, Offender, Fix);  // The search is insensitive
         TextBody[iLine]:= sLine;
        end;
   end;

begin
  Found:= FALSE;
  Result:= TSearchResult.Create;
  Result.FileName:= FileName;

  TextBody:= StringFromFileTSL(FileName);
  try
    for iLine:= 0 to TextBody.Count-1 do
      begin
        sLine:= TextBody[iLine];

        Find('Pointer(PInteger', 'Pointer(PNativeInt');
        Find('Pointer(Integer',  'Pointer(NativeInt');
        Find('Pointer(LongInt',  'Pointer(NativeInt');
        Find('Pointer(Cardinal', 'Pointer(NativeUInt');
      end;

    if Found and Replace then
      begin
        if BackupFile
        then BackupFileBak(FileName);
        StringToFile(FileName, TextBody.Text, woOverwrite, TRUE);
      end;

  finally
    FreeAndNil(TextBody);
  end;
end;


{ Search possible pointer typecasts that are invalid.
  In other words find anything that is not "Pointer(NativeInt" or  "Pointer(NativeUInt".
  This can retun lots of fake positive results.

  Replace is not possible. }
function FindPointerRelax(CONST FileName: string): TSearchResult;
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

        // Search pointer typecasts
        var iColumn:= PosInsensitive('Pointer(', sLine);
        if iColumn > 0 then
            // But ignore valid typecasts
            if  (PosInsensitive('Pointer(NativeInt',  sLine) < 1)
            and (PosInsensitive('Pointer(NativeUInt', sLine) < 1) then
                Result.AddNewPos(iLine, iColumn);
      end;

  finally
    FreeAndNil(TextBody);
  end;
end;


{ Find possible LongInt/PLongInt typecasts.
  On Windows, LongInt is always 32bit! }
function FindLongIntCast(CONST FileName: string; RelaxedSearch: Boolean= True): TSearchResult;
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

        // Search LongInt typecasts
        if RelaxedSearch
        then
          begin
            { Relaxed search }
            var iColumn:= PosInsensitive('LongInt(', sLine);
            if iColumn > 0
            then Result.AddNewPos(iLine, iColumn);
          end
        else
          begin
            { Explicit search }
            var iColumn:= PosInsensitive('LongInt(Self)', sLine);
            if iColumn > 0
            then Result.AddNewPos(iLine, iColumn);
          end;
      end;

  finally
    FreeAndNil(TextBody);
  end;
end;


end.
