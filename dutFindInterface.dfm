object frmSettingsIntf: TfrmSettingsIntf
  Left = 0
  Top = 0
  Caption = '@Settings'
  ClientHeight = 110
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Container: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 341
    Height = 95
    Align = alTop
    TabOrder = 0
    DesignSize = (
      341
      95)
    object edtMethod: TLabeledEdit
      Left = 22
      Top = 25
      Width = 166
      Height = 23
      Hint = 'Enter the name of the method that you are searching for'
      Anchors = [akLeft, akBottom]
      EditLabel.Width = 75
      EditLabel.Height = 15
      EditLabel.Caption = 'Method name'
      TabOrder = 0
      Text = ''
      TextHint = 'MyMethod'
    end
    object chkIntfName: TCheckBox
      AlignWithMargins = True
      Left = 22
      Top = 64
      Width = 187
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Class implements interface:'
      TabOrder = 1
    end
    object edtIntfName: TEdit
      Left = 215
      Top = 61
      Width = 121
      Height = 23
      Anchors = [akLeft, akBottom]
      TabOrder = 2
      TextHint = 'IMyInterface'
    end
  end
end
