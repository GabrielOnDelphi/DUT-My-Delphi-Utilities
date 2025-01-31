object frmAgentResults: TfrmAgentResults
  Left = 0
  Top = 0
  Caption = 'Search results'
  ClientHeight = 508
  ClientWidth = 864
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 3
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  TextHeight = 17
  object splVertical: TSplitter
    Left = 658
    Top = 54
    Height = 454
    Align = alRight
    ResizeStyle = rsUpdate
  end
  object Container: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 57
    Width = 652
    Height = 448
    Align = alClient
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object splResults: TSplitter
      AlignWithMargins = True
      Left = 3
      Top = 179
      Width = 646
      Height = 6
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      MinSize = 10
      ResizeStyle = rsUpdate
    end
    object pnlFiles1: TPanel
      Left = 0
      Top = 0
      Width = 652
      Height = 176
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lbxResults: TListBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 646
        Height = 170
        Hint = 
          'Click to list the content of the file.'#13#10'Double click to load fil' +
          'e in the Delphi IDE.'#13#10'Right click for more options.'
        Align = alClient
        ItemHeight = 17
        PopupMenu = PopupMenu
        TabOrder = 0
        OnClick = lbxResultsClick
        OnDblClick = lbxResultsDblClick
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 664
    Top = 57
    Width = 197
    Height = 448
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object btnSearch: TButton
      Tag = 9
      AlignWithMargins = True
      Left = 3
      Top = 301
      Width = 191
      Height = 44
      Align = alBottom
      Caption = 'Search'
      TabOrder = 0
      OnClick = btnSearchClick
    end
    object btnReplace: TButton
      Tag = 9
      AlignWithMargins = True
      Left = 3
      Top = 351
      Width = 191
      Height = 44
      Align = alBottom
      Caption = 'Replace'
      TabOrder = 1
      OnClick = btnReplaceClick
    end
    object mmoStats: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 191
      Height = 170
      Align = alTop
      TabOrder = 2
      Visible = False
    end
    object chkRelaxed: TCheckBox
      AlignWithMargins = True
      Left = 3
      Top = 278
      Width = 191
      Height = 17
      Hint = 
        'Uses a relaxed search. '#13#10'More exhaustive but can give more false' +
        ' positives'
      Align = alBottom
      Caption = 'Relaxed search'
      TabOrder = 3
    end
    object edtText: TLabeledEdit
      AlignWithMargins = True
      Left = 3
      Top = 197
      Width = 191
      Height = 25
      Margins.Top = 21
      Align = alTop
      EditLabel.Width = 60
      EditLabel.Height = 17
      EditLabel.Caption = 'Search for'
      TabOrder = 4
      Text = ''
    end
    object btnSave: TButton
      Tag = 9
      AlignWithMargins = True
      Left = 3
      Top = 401
      Width = 191
      Height = 44
      Hint = 'Save all lines of code where the input text was found'
      Align = alBottom
      Caption = 'Save lines'
      TabOrder = 5
      OnClick = btnSaveClick
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 858
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      858
      48)
    object edtFilter: TLabeledEdit
      Left = 698
      Top = 17
      Width = 73
      Height = 25
      Hint = 'Multiple extensions can be provided.'#13#10'Example: *.pas;*.dpr;*.inc'
      Anchors = [akTop, akRight]
      EditLabel.Width = 49
      EditLabel.Height = 17
      EditLabel.Caption = 'File filter'
      TabOrder = 0
      Text = '*.pas;*.inc'
    end
    object btnExclude: TButton
      Left = 778
      Top = 14
      Width = 75
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'Exclude...'
      TabOrder = 1
      OnClick = btnExcludeClick
    end
    object edtPath: TCubicPathEdit
      Left = 0
      Top = 0
      Width = 683
      Height = 48
      Path = 'C:\Projects\'
      ShowCreateBtn = False
      OnPathChanged = edtPathPathChanged
      Align = alLeft
      Caption = 'Search in this folder'
      TabOrder = 2
    end
  end
  object PopupMenu: TPopupMenu
    Left = 385
    Top = 348
    object mnuCopyName: TMenuItem
      Caption = 'Copy filename'
      OnClick = mnuCopyNameClick
    end
    object mnuOpen: TMenuItem
      Caption = 'Open'
      OnClick = mnuOpenClick
    end
  end
end
