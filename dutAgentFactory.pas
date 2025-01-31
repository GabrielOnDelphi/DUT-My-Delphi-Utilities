UNIT dutAgentFactory;

INTERFACE

USES
  dutBase, System.SysUtils;

TYPE
  TAgentClass = class of TBaseAgent;

  TDutAgentFactory = class
  private
  public
    class function GetAgentDescription(AgentID: Integer): string; static;
    class function CreateAgent(const AgentClass: TAgentClass; BackupFile: Boolean): TBaseAgent;
  end;

function IDToClassName(const ID: Integer): TAgentClass;

IMPLEMENTATION

USES
  dutWin64Pointer, dutWin64Api, dutWin64Extended, dutCodeUtils;




class function TDutAgentFactory.CreateAgent(const AgentClass: TAgentClass; BackupFile: Boolean): TBaseAgent;
begin
  if NOT Assigned(AgentClass) then
    RAISE Exception.Create('Agent class not assigned');

  Result := TBaseAgent(AgentClass.Create(BackupFile));
end;


class function TDutAgentFactory.GetAgentDescription(AgentID: Integer): string;
begin
  VAR AgentClass:= IDToClassName(AgentID);
  Result := AgentClass.Description;
end;



function IDToClassName(const ID: Integer): TAgentClass;
begin
  case ID of
    // WinAPI
    50: Result := TAgent_APISendMessage;
    51: Result := TAgent_APIPerform;
    52: Result := TAgent_APISetWindowLong;

    // Pointer(Integer & Pointer(LongInt
    60: Result := TAgent_PointerTypecast; { Search for 'Pointer(Integer(' . We cannot assume anymorethat SizeOf(Pointer)=SizeOf(Integer/Cardinal/Longint). }
    61: Result := TAgent_PointerLongInt;  { Search for possible LongInt/PLongInt typecasts. On Windows, LongInt is always 32bit! }

    // Extended
    70: Result := TAgent_Extended;        { Search for occurrences of the Extended type and reports them. }
    71: Result := TAgent_ExtendedPacked;

    //Find code
   999: Result := TAgent_FindText;
   else
      RAISE Exception.Create('Unknown agent ID:'+ IntToStr(ID));
  end;

         (*
           // Find interface implementation
           1: begin
                {if chkIntfName.Checked
                then IntfName:= edtIntfName.Text
                else IntfName:= '';}
               // PasParser.FindImplementation(edtMethod.Text, IntfName);
              end;

           // Try/Except
           3: Agent.FindTryExcept(False);
           4: Agent.FindTryExcept(true);

           // SetFocus
           5: Agent.FindSetFocus(False);
           6: Agent.FindSetFocus(True);

           // BOM
           7: Agent.ConvertToUTF(TRUE);
           8: Agent.ConvertToAnsi;
           9: Agent.HasBOM;

           // FreeAndNil
           10: Agent.ReplaceFree(False);
           11: Agent.ReplaceFree(True);

           // Search
           //20: PasParser.ExtractCode;

           // Format code
           80: Agent.FormatCodeTight({TRUE});
         else
           MesajError('Invalid button tag!');
         end;
         *)

end;


end.