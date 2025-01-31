object frmIntfImpl: TfrmIntfImpl
  Left = 0
  Top = 0
  Caption = 'Find implementation'
  ClientHeight = 147
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Container: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 393
    Height = 129
    TabOrder = 0
    DesignSize = (
      393
      129)
    object lblDescription: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 385
      Height = 15
      Align = alTop
      Caption = 
        'Search all selected files for the class that implements the inte' +
        'rface below:'
    end
    object edtMethod: TLabeledEdit
      Left = 22
      Top = 57
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
      Top = 96
      Width = 187
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Class implements interface:'
      TabOrder = 1
    end
    object edtIntfName: TEdit
      Left = 215
      Top = 93
      Width = 121
      Height = 23
      Anchors = [akLeft, akBottom]
      TabOrder = 2
      TextHint = 'IMyInterface'
    end
  end
end
