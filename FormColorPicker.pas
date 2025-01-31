UNIT FormColorPicker;
{ Gabriel Moraru 2011 }

INTERFACE

USES
  Windows, SysUtils, Classes, Graphics, Controls, Vcl.Forms, cbAppDataForm, Dialogs,
  StdCtrls, ccCore, cGraphUtil, ExtCtrls, Vcl.Mask;

TYPE
  TfrmClrPick = class(TLightForm)
    Container: TPanel;
    Label4: TLabel;
    Panel1: TPanel;
    lblHTML: TLabel;
    lblDelphiHex: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtEnterClr: TLabeledEdit;
    ColorDialog: TColorDialog;
    btnChooseClr: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnChooseClrClick(Sender: TObject);
    procedure lblHTMLClick(Sender: TObject);
    procedure lblDelphiHexClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure edtEnterClrKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtEnterClrChange(Sender: TObject);
  private
    procedure ShowColorDetails(Color: TColor);
  public
 end;


IMPLEMENTATION {$R *.dfm}
uses csSystem, csExecuteShell;





procedure TfrmClrPick.btnChooseClrClick(Sender: TObject);
begin
 if ColorDialog.Execute
 then ShowColorDetails(ColorDialog.Color);
end;


procedure TfrmClrPick.ShowColorDetails(Color: TColor);
begin
 label1.Caption:= 'Delphi color name: '+   ColorToString(Color);
 label2.Caption:= 'Delphi color (int): '+ IntToStr(Color);
 lblDelphiHex.Caption:= 'Delphi color (hex): $'+ IntToHex(Color, 6);

 lblHTML.Caption:= 'Windows color (hex): '+ ColorToHtml(Color);
 StringToClipboard(i2s(Color));
 Panel1.Color:= Color;
end;


procedure TfrmClrPick.edtEnterClrChange(Sender: TObject);
VAR Color: TColor;
begin
 Caption:= 'Delphi Color Picker';
 TRY
  Color:= StringToColor(edtEnterClr.Text);
  ShowColorDetails(Color);
 EXCEPT
  Caption:= 'Invalid color';
 END;
end;


procedure TfrmClrPick.edtEnterClrKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key= VK_RETURN
 then Panel1.Color:= StringToColor(edtEnterClr.Text);
end;


procedure TfrmClrPick.FormCreate(Sender: TObject);
begin
// Application.ProcessMessages;
 edtEnterClrChange(Sender);
end;


procedure TfrmClrPick.Label4Click(Sender: TObject);
begin
 ExecuteURL('http://www.GabrielMoraru.com')
end;


procedure TfrmClrPick.lblDelphiHexClick(Sender: TObject);
begin
 StringToClipboard(IntToHex(ColorDialog.Color, 6));
end;


procedure TfrmClrPick.lblHTMLClick(Sender: TObject);
begin
 StringToClipboard(ColorToHtml(ColorDialog.Color));
end;


end.
