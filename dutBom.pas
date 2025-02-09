UNIT dutBom;

{=============================================================================================================
   Gabriel Moraru
   2022
   See Copyright.txt
--------------------------------------------------------------------------------------------------------------
   UTF8
   Convert between ANSI and UTF8

   Wikipedia:
     The UTF-8 representation of the BOM is the (hexadecimal) byte sequence EF BB BF .
     The Unicode Standard permits the BOM in UTF-8, but does not require or recommend its use.
=============================================================================================================}

INTERFACE

USES
  System.SysUtils, System.Classes, cmSearchResult, dutBase;

TYPE
  TAgent_BomExists = class(TBaseAgent)
  public
    procedure Execute(const FileName: string); override;
    class function Description: string; override;
  end;

  TAgent_BOM_AnsiToUtf = class(TBaseAgent)
  public
    procedure Execute(const FileName: string); override;
    class function Description: string; override;
  end;

  TAgent_BOM_Utf2Ansi = class(TBaseAgent)
  public
    procedure Execute(const FileName: string); override;
    class function Description: string; override;
  end;



IMPLEMENTATION

USES
   cmPascal, ccCore, ccTextFile;



{=============================================================================================================
   HAS BOM?
=============================================================================================================}

class function TAgent_BomExists.Description: string;
begin
  Result:= 'Shows if the files in the specified folder have BOM or not.';
end;


procedure TAgent_BomExists.Execute(const FileName: string);
begin
  inherited Execute(FileName);

  if NOT ccTextFile.FileHasBOM(SearchResults.Last.FileName)
  then SearchResults.Last.AddNewPos('File without BOM.');         // We indicate that this file was found without BOM

  Finalize;
end;







{=============================================================================================================
   Convert Ansi To Utf
=============================================================================================================}
class function TAgent_BOM_AnsiToUtf.Description: string;
begin
  Result:= 'Converts ANSI file to UTF8 (and adds BOM to the file).';
end;


procedure TAgent_BOM_AnsiToUtf.Execute(const FileName: string);
begin
  inherited Execute(FileName);

  //todo: AddBOM: Boolean
 if NOT ccTextFile.FileHasBOM(SearchResults.Last.FileName) then
   begin
     ccTextFile.ConvertToUTF(SearchResults.Last.FileName);
     SearchResults.Last.AddNewPos('Converted to UTF8');
   end;

  Finalize; // Increment counters
end;








{=============================================================================================================
   Convert UTF To Ansi
=============================================================================================================}
class function TAgent_BOM_Utf2Ansi.Description: string;
begin
  Result:= 'Converts UTF8 file to ANSI (and adds BOM to the file).';
end;


procedure TAgent_BOM_Utf2Ansi.Execute(const FileName: string);
begin
  inherited Execute(FileName);

  if ccTextFile.ConvertToAnsi(SearchResults.Last.FileName)
  then SearchResults.Last.AddNewPos('Converted to ANSI');

  Finalize; // Increment counters
end;









end.
