object frmSettingsIntf: TfrmSettingsIntf
  Left = 0
  Top = 0
  Caption = '@Settings'
  ClientHeight = 127
  ClientWidth = 207
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 4
  TextHeight = 15
  object Container: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 201
    Height = 102
    Align = alTop
    TabOrder = 0
    object edtMethod: TLabeledEdit
      AlignWithMargins = True
      Left = 5
      Top = 68
      Width = 191
      Height = 23
      Hint = 
        'Enter the name of the method that you are searching for.'#13#10'If you' +
        ' leave the "Interface" field above empty, the agent will list an' +
        'y class that implements this method.'
      Margins.Left = 4
      Margins.Top = 20
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      EditLabel.Width = 75
      EditLabel.Height = 15
      EditLabel.Caption = 'Method name'
      TabOrder = 0
      Text = ''
      TextHint = 'MyMethod'
    end
    object edtIntfName: TLabeledEdit
      AlignWithMargins = True
      Left = 5
      Top = 21
      Width = 191
      Height = 23
      Hint = 
        'Enter the name of the interface. Any class implementing this int' +
        'erface will be listed below.'
      Margins.Left = 4
      Margins.Top = 20
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      EditLabel.Width = 46
      EditLabel.Height = 15
      EditLabel.Caption = 'Interface'
      TabOrder = 1
      Text = ''
      TextHint = 'IMyInterface'
    end
  end
end
