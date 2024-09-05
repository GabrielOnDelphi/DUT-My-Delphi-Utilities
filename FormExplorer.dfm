object frmExplorer: TfrmExplorer
  Left = 0
  Top = 0
  Caption = 'Explorer'
  ClientHeight = 78
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 3
  OnDestroy = FormDestroy
  TextHeight = 15
  object Container: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 767
    Height = 66
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      767
      66)
    object edtFilter: TLabeledEdit
      Left = 592
      Top = 29
      Width = 71
      Height = 23
      Hint = 'Multiple extensions can be provided.'#13#10'Example: *.pas;*.dpr;*.inc'
      Anchors = [akTop, akRight]
      EditLabel.Width = 45
      EditLabel.Height = 15
      EditLabel.Caption = 'File filter'
      TabOrder = 0
      Text = '*.pas;*.inc'
    end
    object edtPath: TLabeledEdit
      Left = 6
      Top = 29
      Width = 577
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 129
      EditLabel.Height = 17
      EditLabel.Caption = 'Search in this folder:'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 1
      Text = 'C:\My Projects'
    end
    object btnExclude: TButton
      Left = 667
      Top = 26
      Width = 81
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'Exclude...'
      TabOrder = 2
      OnClick = btnExcludeClick
    end
  end
end
