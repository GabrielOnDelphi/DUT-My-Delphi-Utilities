object frmExclude: TfrmExclude
  Left = 0
  Top = 0
  Caption = 'Exclude folders'
  ClientHeight = 246
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 4
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 578
    Height = 17
    Hint = 
      'Exclude the following folders from the search.'#13#10'One folder per l' +
      'ine.'
    Align = alTop
    Caption = 'Exclude the following folders from the search:'
  end
  object mmoExclude: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 26
    Width = 578
    Height = 217
    Hint = 
      'Exclude the following folders from the search.'#13#10'One folder per l' +
      'ine.'
    Align = alClient
    Lines.Strings = (
      'c:\MySourceCode\3rd party libs\')
    TabOrder = 0
  end
end
