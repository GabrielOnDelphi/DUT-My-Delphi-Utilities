object frmResults: TfrmResults
  Left = 0
  Top = 0
  Caption = '@Runtime'
  ClientHeight = 548
  ClientWidth = 935
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 3
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object Container: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 929
    Height = 542
    Align = alClient
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object splResults: TSplitter
      AlignWithMargins = True
      Left = 3
      Top = 179
      Width = 923
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
      Width = 929
      Height = 176
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object splVertical: TSplitter
        Left = 772
        Top = 0
        Height = 176
        Align = alRight
        ResizeStyle = rsUpdate
      end
      object lbxResults: TListBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 766
        Height = 170
        Hint = 
          'Click to list the content of the file.'#13#10'Double click to load fil' +
          'e in the Delphi IDE.'#13#10'Right click for more options.'
        Align = alClient
        ItemHeight = 15
        PopupMenu = PopupMenu
        TabOrder = 0
        OnClick = lbxResultsClick
        OnDblClick = lbxResultsDblClick
      end
      object mmoStats: TMemo
        AlignWithMargins = True
        Left = 778
        Top = 3
        Width = 148
        Height = 170
        Align = alRight
        TabOrder = 1
        Visible = False
      end
    end
  end
  object PopupMenu: TPopupMenu
    Left = 881
    Top = 12
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
