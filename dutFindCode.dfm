object frmSettingsFindCode: TfrmSettingsFindCode
  Left = 0
  Top = 0
  Caption = '@Settings'
  ClientHeight = 91
  ClientWidth = 295
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
    Width = 289
    Height = 59
    Align = alTop
    TabOrder = 0
    object edtText: TLabeledEdit
      AlignWithMargins = True
      Left = 4
      Top = 22
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
