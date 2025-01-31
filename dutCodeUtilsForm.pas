unit dutCodeUtilsForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmIntfImpl = class(TForm)
    Container: TPanel;
    lblDescription: TLabel;
    edtMethod: TLabeledEdit;
    chkIntfName: TCheckBox;
    edtIntfName: TEdit;
  private
  public
  end;

var
  frmIntfImpl: TfrmIntfImpl;

implementation
{$R *.dfm}

end.
