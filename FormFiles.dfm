object frmResults: TfrmResults
  Left = 0
  Top = 0
  Caption = 'frmResults'
  ClientHeight = 542
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnlContainer: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 790
    Height = 536
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter: TSplitter
      Left = 0
      Top = 258
      Width = 790
      Height = 4
      Cursor = crVSplit
      Align = alTop
      MinSize = 10
      ResizeStyle = rsUpdate
    end
    object lblCurFile: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 243
      Width = 784
      Height = 15
      Align = alTop
      Visible = False
    end
    object pnlFiles: TPanel
      Left = 0
      Top = 0
      Width = 790
      Height = 240
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnlFiles'
      ShowCaption = False
      TabOrder = 0
      object lbxResults: TListBox
        AlignWithMargins = True
        Left = 3
        Top = 75
        Width = 784
        Height = 162
        Hint = 
          'Click to show this file here.'#13#10'Double click to load file in the ' +
          'Delphi IDE.'
        Align = alClient
        ItemHeight = 15
        TabOrder = 0
      end
      object pnlPath: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 784
        Height = 66
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          784
          66)
        object edtFilter: TLabeledEdit
          Left = 526
          Top = 29
          Width = 71
          Height = 23
          Hint = 'multiple excensions can be provided'
          Anchors = [akTop, akRight]
          EditLabel.Width = 45
          EditLabel.Height = 15
          EditLabel.Caption = 'File filter'
          TabOrder = 0
          Text = '*.pas'
        end
        object edtPath: TLabeledEdit
          Left = 6
          Top = 29
          Width = 513
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
          Left = 601
          Top = 27
          Width = 81
          Height = 29
          Anchors = [akTop, akRight]
          Caption = 'Exclude...'
          TabOrder = 2
        end
        object chkShowAllFiles: TCheckBox
          Left = 689
          Top = 33
          Width = 97
          Height = 17
          Hint = 
            'If checked, lists all scanned files, even those that do not cont' +
            'ained the searched text.'
          Anchors = [akTop, akRight]
          Caption = 'Show all files'
          TabOrder = 3
        end
      end
    end
    object pgBatchRepl: TPageControl
      Left = 0
      Top = 262
      Width = 790
      Height = 274
      ActivePage = tabOTA
      Align = alClient
      TabOrder = 1
      object tabStats: TTabSheet
        Caption = 'Statistics'
        object mmoStats: TMemo
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 776
          Height = 238
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object tabEdit: TTabSheet
        Caption = 'Edit'
        object mmoView: TMemo
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 776
          Height = 194
          Align = alClient
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object pnlBtm: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 203
          Width = 776
          Height = 38
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            776
            38)
          object lblRewind: TLabel
            AlignWithMargins = True
            Left = 177
            Top = 3
            Width = 100
            Height = 35
            Align = alLeft
            Alignment = taCenter
            AutoSize = False
            BiDiMode = bdLeftToRight
            Caption = 'Rewinded'
            Color = 8454143
            ParentBiDiMode = False
            ParentColor = False
            Transparent = False
            Layout = tlCenter
            Visible = False
          end
          object btnSave: TButton
            AlignWithMargins = True
            Left = 682
            Top = 3
            Width = 91
            Height = 32
            Hint = 'Save changes in this file'
            Align = alRight
            Caption = 'Save'
            TabOrder = 0
          end
          object btnOpenIDE: TButton
            AlignWithMargins = True
            Left = 585
            Top = 3
            Width = 91
            Height = 32
            Hint = 'Open this file in IDE'
            Align = alRight
            Caption = 'Open in IDE'
            TabOrder = 1
          end
          object btnPrev: TButton
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 81
            Height = 30
            Hint = 'Show previous occurence'
            Margins.Top = 4
            Margins.Bottom = 4
            Align = alLeft
            Caption = '< Prev'
            TabOrder = 2
            Visible = False
          end
          object btnNext: TButton
            AlignWithMargins = True
            Left = 90
            Top = 4
            Width = 81
            Height = 30
            Hint = 'Show next occurence'
            Margins.Top = 4
            Margins.Bottom = 4
            Align = alLeft
            Caption = 'Next >'
            TabOrder = 3
            Visible = False
          end
          object btnReset: TButton
            AlignWithMargins = True
            Left = 504
            Top = 3
            Width = 75
            Height = 32
            Hint = 'Reset search in this file'
            Align = alRight
            Caption = 'Reset'
            TabOrder = 4
            Visible = False
          end
          object chkSaveLog: TCheckBox
            Left = 407
            Top = 11
            Width = 85
            Height = 17
            Hint = 'Save statistics to disk as "Tool Output.txt"'
            Anchors = [akRight]
            Caption = 'Save Log'
            Checked = True
            State = cbChecked
            TabOrder = 5
          end
        end
      end
      object tabOTA: TTabSheet
        Caption = 'Test OTA'
        ImageIndex = 2
        object mmoOTA: TMemo
          Left = 21
          Top = 17
          Width = 603
          Height = 85
          Lines.Strings = (
            
              'Filename=c:\My projects\Packages\CubicCommonControls\ccRegistry.' +
              'pas'
            'Line=8'
            'Col=12'
            'Comment=')
          TabOrder = 0
        end
        object btnTest: TButton
          Left = 23
          Top = 115
          Width = 112
          Height = 25
          Caption = 'Send to IDE'
          TabOrder = 1
        end
      end
    end
  end
end
