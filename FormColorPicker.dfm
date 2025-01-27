object frmClrPick: TfrmClrPick
  Left = 0
  Top = 0
  BorderIcons = [biMaximize]
  BorderStyle = bsNone
  Caption = 'Delphi Color Picker'
  ClientHeight = 337
  ClientWidth = 613
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  ShowHint = True
  SnapBuffer = 3
  OnCreate = FormCreate
  TextHeight = 17
  object Label1: TLabel
    Left = 20
    Top = 11
    Width = 73
    Height = 17
    Caption = 'Delphi name'
  end
  object Label2: TLabel
    Left = 20
    Top = 37
    Width = 81
    Height = 17
    Caption = 'Delphi clr (int)'
  end
  object lblDelphiHex: TLabel
    Left = 20
    Top = 63
    Width = 38
    Height = 17
    Cursor = crHandPoint
    Caption = 'Label1'
    OnClick = lblDelphiHexClick
  end
  object Label4: TLabel
    Left = 0
    Top = 320
    Width = 613
    Height = 17
    Cursor = crHandPoint
    Align = alBottom
    Alignment = taCenter
    Caption = 'Click label to copy color to clipboard'
    OnClick = Label4Click
  end
  object lblHTML: TLabel
    Left = 20
    Top = 90
    Width = 45
    Height = 17
    Cursor = crHandPoint
    Caption = 'Html clr'
    ParentShowHint = False
    ShowHint = True
    OnClick = lblHTMLClick
  end
  object btnChooseClr: TButton
    Left = 20
    Top = 230
    Width = 121
    Height = 41
    Caption = 'Choose color'
    TabOrder = 0
    OnClick = btnChooseClrClick
  end
  object Panel1: TPanel
    Left = 234
    Top = 0
    Width = 379
    Height = 320
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Your color'
    ParentBackground = False
    TabOrder = 1
  end
  object edtEnterClr: TLabeledEdit
    Left = 20
    Top = 185
    Width = 121
    Height = 25
    EditLabel.Width = 146
    EditLabel.Height = 17
    EditLabel.Caption = 'Enter color (format BGR):'
    TabOrder = 2
    Text = '$00FF00'
    OnChange = edtEnterClrChange
    OnKeyDown = edtEnterClrKeyDown
  end
  object ColorDialog: TColorDialog
    Options = [cdFullOpen, cdSolidColor, cdAnyColor]
    Left = 343
    Top = 69
  end
end
