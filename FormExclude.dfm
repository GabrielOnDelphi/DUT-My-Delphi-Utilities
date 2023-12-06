object frmExclude: TfrmExclude
  Left = 0
  Top = 0
  Caption = 'Exclude folders'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 4
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object btnOK: TButton
    AlignWithMargins = True
    Left = 3
    Top = 398
    Width = 618
    Height = 40
    Align = alBottom
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object mmoExclude: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 618
    Height = 389
    Hint = 'Exclude the following folders from the search'
    Align = alClient
    TabOrder = 1
  end
end
