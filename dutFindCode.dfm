object frmSettingsFindCode: TfrmSettingsFindCode
  Left = 0
  Top = 0
  Caption = '@Settings'
  ClientHeight = 90
  ClientWidth = 291
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
    Width = 285
    Height = 70
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 398
      Height = 15
      Align = alTop
      Caption = 
        'Search all files for the specified line of code and returns the ' +
        'collected results'
    end
    object edtText: TLabeledEdit
      AlignWithMargins = True
      Left = 4
      Top = 40
      Width = 281
      Height = 23
      Margins.Top = 21
      Align = alTop
      EditLabel.Width = 53
      EditLabel.Height = 15
      EditLabel.Caption = 'Search for'
      TabOrder = 0
      Text = ''
    end
  end
end
