﻿UNIT dutBase;

{=============================================================================================================
   Gabriel Moraru
   2025.01
   See Copyright.txt
--------------------------------------------------------------------------------------------------------------
   Base class.
   Provides support for checking PAS files for specific lines of code.
   It holds the list of "Search results".

   The actual search code is implemented in: dutWin64, dutUpgrade, dutUtils which all inherit from TBaseAgent
-------------------------------------------------------------------------------------------------------------}

INTERFACE

USES
  System.SysUtils, System.Classes, cmSearchResult;

TYPE
  TBaseAgent= class(TObject)
   private
    FBackupFile: Boolean;          // If true, create a backup file IF the file is changed (in case of 'replace')
    procedure DoSave;
    procedure NewFile(const FileName: String);
   protected
    FFound  : Boolean;             // I already have:  SearchResults.Last.Found !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   // The searched text was found
    FRelaxed: Boolean;             // Uses a relaxed search. More exhaustive but can give more false positives
    TextBody: TStringList;
   public
    Needle: string;                // Text to find. Some agents will not use this field.
    CaseSensitive: Boolean;        // Can we convert the Needle/Haystack to lowercase?
    Replace: Boolean;              // The found text should be replaced

    // Results
    FoundFiles: Integer;
    FoundLines: Integer;
    SearchResults: TSearchResults; // A list of results where the issue (invalid code) was found

    constructor Create(BackupFile: Boolean); virtual;
    destructor Destroy; override;

    procedure Execute(const FileName: string); virtual;
    procedure Finalize; virtual;
    class function Description: string; virtual; abstract;

    //Capabilities
    class function CanRelax  : Boolean; virtual;   // True if the agent can do a relaxed search
    class function CanReplace: Boolean; virtual;   // True if the agent can automatically replace the text
  end;


IMPLEMENTATION
USES ccIO, ccTextFile;


{-------------------------------------------------------------------------------------------------------------
   CONSTRUCTOR
-------------------------------------------------------------------------------------------------------------}
constructor TBaseAgent.Create(BackupFile: Boolean);
begin
  inherited Create;
  Replace:= FALSE;
  FBackupFile:= TRUE;
  TextBody:= TStringList.Create;
  TextBody.Text:= 'Nothing loaded yet!';
  SearchResults:= TSearchResults.Create(True);
end;


destructor TBaseAgent.Destroy;
begin
  FreeAndNil(TextBody);
  FreeAndNil(SearchResults);
  inherited Destroy;
end;




{-------------------------------------------------------------------------------------------------------------
   START
-------------------------------------------------------------------------------------------------------------}

{ Derived class must override this method }
procedure TBaseAgent.Execute(const FileName: string);
begin
  NewFile(FileName);
end;


{ Computes statistics and saves results to disk }
procedure TBaseAgent.Finalize;
begin
  if FFound then DoSave;

  if SearchResults.Last.Found then
    begin
      Inc(FoundFiles);
      Inc(FoundLines, SearchResults.Last.Count);
    end;

  TextBody.Clear;
end;


{ Mark this file as the current file that we work on,
  and add it to the Search Results }
procedure TBaseAgent.NewFile(const FileName: String);
begin
  SearchResults.Add(TSearchResult.Create(FileName));
  TextBody.Text:= StringFromFile(FileName);
end;



{-------------------------------------------------------------------------------------------------------------
   -
-------------------------------------------------------------------------------------------------------------}
procedure TBaseAgent.DoSave;
begin
  if Replace then
    begin
      // Do backup
      if FBackupFile
      then BackupFileBak(SearchResults.Last.FileName);

      // Write the new PAS file to disk
      StringToFile(SearchResults.Last.FileName, TextBody.Text, woOverwrite, wpAuto);
    end;
end;


class function TBaseAgent.CanRelax: Boolean;
begin
  Result:= FALSE; // Most agents can't
end;


class function TBaseAgent.CanReplace: Boolean;
begin
  Result:= FALSE; // Most agents can't
end;



end.
