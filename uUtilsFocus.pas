UNIT uUtilsFocus;

{=============================================================================================================
   2023.03
   Gabriel Moraru
=============================================================================================================}

INTERFACE
USES
   Winapi.Windows, System.TypInfo, System.Classes, System.SysUtils,
   Vcl.StdCtrls, Vcl.Menus, Vcl.ActnList, Vcl.ComCtrls, Vcl.Controls, Vcl.Forms;

 { Focus }
 function  CanFocus (Control: TWinControl): Boolean;
 procedure SetFocus (Control: TWinControl);


IMPLEMENTATION

USES ccCore;




{--------------------------------------------------------------------------------------------------
   VCL
--------------------------------------------------------------------------------------------------}

{ The CanFocus VCL function is totally flawed and unreliable: https://gabrielmoraru.com/setfocus-is-broken-in-delphi/
  Use my code instead
  https://stackoverflow.com/questions/41016976 }
function CanFocus(Control: TWinControl): Boolean;
begin
 Result:= Control.CanFocus AND Control.Enabled AND Control.Visible;
 if Result
 AND NOT Control.InheritsFrom(TForm)
 then
   { Recursive call:
     This control might be hosted by a panel which could be also invisible/disabled. So, we need to check all the parents down the road. We stop when we encounter the parent Form.
     Also see: GetParentForm }
   Result:= CanFocus(Control.Parent);
end;


procedure SetFocus(Control: TWinControl);
begin
 if CanFocus(Control)
 then Control.SetFocus;
end;



end.
