object frmMain: TfrmMain
  Left = 286
  Top = 124
  AlphaBlend = True
  AlphaBlendValue = 250
  Caption = 'DUT (Delphi Utilities) - Gabriel Moraru 2022'
  ClientHeight = 799
  ClientWidth = 926
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 3
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object pgMain: TPageControl
    Left = 0
    Top = 0
    Width = 926
    Height = 799
    ActivePage = TabSheet11
    Align = alClient
    TabOrder = 0
    OnChange = pgMainChange
    OnChanging = pgMainChanging
    object tabFind: TTabSheet
      Caption = 'Find implentation'
      ImageIndex = 7
      object Panel12: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 912
        Height = 149
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        DesignSize = (
          912
          149)
        object Label6: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 902
          Height = 17
          Align = alTop
          Alignment = taRightJustify
          Caption = 
            'Search in all files for the class that implements the specified ' +
            'interface.'
        end
        object edtMethod: TLabeledEdit
          Left = 60
          Top = 77
          Width = 166
          Height = 25
          Hint = 'Enter the name of the method that you are searching for'
          Anchors = [akLeft, akBottom]
          EditLabel.Width = 82
          EditLabel.Height = 17
          EditLabel.Caption = 'Method name'
          TabOrder = 0
          TextHint = 'MyMethod'
        end
        object Button4: TButton
          Tag = 1
          AlignWithMargins = True
          Left = 451
          Top = 82
          Width = 125
          Height = 33
          Hint = 
            'Search in all files for the class that implements the specified ' +
            'interface.'
          Anchors = [akLeft, akBottom]
          Caption = 'Search'
          TabOrder = 1
          OnClick = StartSearch
        end
        object chkIntfName: TCheckBox
          AlignWithMargins = True
          Left = 60
          Top = 116
          Width = 193
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = 'Class implements interface:'
          TabOrder = 2
        end
        object edtIntfName: TEdit
          Left = 245
          Top = 111
          Width = 121
          Height = 25
          Anchors = [akLeft, akBottom]
          TabOrder = 3
          TextHint = 'IMyInterface'
        end
      end
    end
    object tabReplace: TTabSheet
      Caption = 'Upgrade code'
      object lblTools: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 9
        Width = 912
        Height = 17
        Margins.Top = 9
        Align = alTop
        Caption = 'Tools:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TLabel
        AlignWithMargins = True
        Left = 3
        Top = 32
        Width = 912
        Height = 17
        Align = alTop
        Caption = 'These tools can help you to upgrade old code'
      end
      object pgTools: TPageControl
        AlignWithMargins = True
        Left = 3
        Top = 55
        Width = 912
        Height = 120
        Margins.Bottom = 17
        ActivePage = tabSetFocus
        Align = alTop
        TabOrder = 0
        object TabSheet4: TTabSheet
          Caption = 'Try/Except'
          ImageIndex = 2
          object Label3: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 898
            Height = 17
            Align = alTop
            Alignment = taRightJustify
            Caption = 'Finds all try/except lines. See details.'
          end
          object Panel2: TPanel
            Left = 0
            Top = 53
            Width = 904
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnReplace: TButton
              Tag = 4
              AlignWithMargins = True
              Left = 134
              Top = 3
              Width = 125
              Height = 29
              Hint = 'This will change the files'
              Align = alLeft
              Caption = 'Replace'
              TabOrder = 0
              OnClick = StartSearch
            end
            object Button1: TButton
              Tag = 3
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 125
              Height = 29
              Hint = 'This will not change the files'
              Align = alLeft
              Caption = 'Search'
              TabOrder = 1
              OnClick = StartSearch
            end
            object btnHelp1: TButton
              AlignWithMargins = True
              Left = 832
              Top = 3
              Width = 69
              Height = 29
              Align = alRight
              Caption = 'Details'
              TabOrder = 2
              OnClick = btnHelp1Click
            end
          end
        end
        object tabSetFocus: TTabSheet
          Caption = '.SetFocus;'
          ImageIndex = 3
          DesignSize = (
            904
            88)
          object Label4: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 898
            Height = 17
            Align = alTop
            Alignment = taRightJustify
            Caption = 
              'SetFocus is broken in Delphi. Replaces MyControl.SetFocus with a' +
              ' my better alternative.'
          end
          object btnHelp2: TButton
            Left = 808
            Top = 26
            Width = 92
            Height = 25
            Anchors = [akLeft, akRight]
            Caption = 'Details'
            TabOrder = 0
            OnClick = btnHelp2Click
          end
          object Panel3: TPanel
            Left = 0
            Top = 53
            Width = 904
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 1
            object btnReplaceFocus: TButton
              Tag = 6
              AlignWithMargins = True
              Left = 134
              Top = 3
              Width = 125
              Height = 29
              Hint = 
                'Replace "SetFocus" in all files (according to the filter) in the' +
                ' specified folder.'
              Align = alLeft
              Caption = 'Replace'
              TabOrder = 0
              OnClick = StartSearch
            end
            object btnSetFocus: TButton
              Tag = 5
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 125
              Height = 29
              Hint = 'This will not change the files'
              Align = alLeft
              Caption = 'Search'
              TabOrder = 1
              OnClick = StartSearch
            end
          end
        end
      end
      object pnlContainer: TPanel
        Left = 0
        Top = 192
        Width = 918
        Height = 575
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Splitter: TSplitter
          Left = 0
          Top = 263
          Width = 918
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
          Width = 912
          Height = 17
          Align = alTop
          Visible = False
        end
        object pnlFiles: TPanel
          Left = 0
          Top = 0
          Width = 918
          Height = 240
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnlFiles'
          ShowCaption = False
          TabOrder = 0
          object lbxResults: TListBox
            AlignWithMargins = True
            Left = 3
            Top = 69
            Width = 912
            Height = 168
            Hint = 
              'Click to show this file here.'#13#10'Double click to load file in the ' +
              'Delphi IDE.'
            Align = alClient
            ItemHeight = 17
            PopupMenu = PopupMenu
            TabOrder = 0
            OnClick = lbxResultsClick
            OnDblClick = lbxResultsDblClick
          end
          object pnlPath: TPanel
            Left = 0
            Top = 0
            Width = 918
            Height = 66
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              918
              66)
            object edtFilter: TLabeledEdit
              Left = 660
              Top = 29
              Width = 71
              Height = 25
              Hint = 'multiple excensions can be provided'
              Anchors = [akTop, akRight]
              EditLabel.Width = 49
              EditLabel.Height = 17
              EditLabel.Caption = 'File filter'
              TabOrder = 0
              Text = '*.pas'
            end
            object edtPath: TLabeledEdit
              Left = 6
              Top = 29
              Width = 647
              Height = 25
              Anchors = [akLeft, akTop, akRight]
              EditLabel.Width = 128
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
              OnChange = edtPathChange
            end
            object btnExclude: TButton
              Left = 735
              Top = 27
              Width = 81
              Height = 29
              Anchors = [akTop, akRight]
              Caption = 'Exclude...'
              TabOrder = 2
              OnClick = btnExcludeClick
            end
            object chkShowAllFiles: TCheckBox
              Left = 823
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
          Top = 267
          Width = 918
          Height = 308
          ActivePage = tabEdit
          Align = alClient
          TabOrder = 1
          object tabStats: TTabSheet
            Caption = 'Statistics'
            object mmoStats: TMemo
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 904
              Height = 270
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
              Width = 904
              Height = 226
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
              Top = 235
              Width = 904
              Height = 38
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              DesignSize = (
                904
                38)
              object lblRewind: TLabel
                AlignWithMargins = True
                Left = 177
                Top = 3
                Width = 100
                Height = 32
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
                Left = 810
                Top = 3
                Width = 91
                Height = 32
                Hint = 'Save changes in this file'
                Align = alRight
                Caption = 'Save'
                TabOrder = 0
                OnClick = btnSaveClick
              end
              object btnOpenIDE: TButton
                AlignWithMargins = True
                Left = 713
                Top = 3
                Width = 91
                Height = 32
                Hint = 'Open this file in IDE'
                Align = alRight
                Caption = 'Open in IDE'
                TabOrder = 1
                OnClick = btnOpenIDEClick
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
                OnClick = btnPrevClick
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
                OnClick = btnNextClick
              end
              object btnReset: TButton
                AlignWithMargins = True
                Left = 632
                Top = 3
                Width = 75
                Height = 32
                Hint = 'Reset search in this file'
                Align = alRight
                Caption = 'Reset'
                TabOrder = 4
                Visible = False
                OnClick = btnResetClick
              end
              object chkSaveLog: TCheckBox
                Left = 535
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
            object Memo1: TMemo
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
              OnClick = btnTestClick
            end
          end
        end
      end
    end
    object tabWin64: TTabSheet
      Caption = 'Migrate to Win64'
      ImageIndex = 8
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 9
        Width = 912
        Height = 17
        Margins.Top = 9
        Align = alTop
        Caption = 'Tools for 64 bit migration - Winapi Issues'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PageControl2: TPageControl
        AlignWithMargins = True
        Left = 3
        Top = 32
        Width = 912
        Height = 120
        Margins.Bottom = 17
        ActivePage = tabSetWinLong
        Align = alTop
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'SendMessage'
          object Label2: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 26
            Width = 898
            Height = 17
            Align = alTop
            Alignment = taRightJustify
            Caption = 'Looks for files where we have SendMessage().'
          end
          object Label11: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 898
            Height = 17
            Align = alTop
            Alignment = taRightJustify
            Caption = '64 bit migration - Winapi Issues'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pnlButtons: TPanel
            Left = 0
            Top = 53
            Width = 904
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnSendMsgGlobal: TButton
              Tag = 51
              AlignWithMargins = True
              Left = 152
              Top = 3
              Width = 192
              Height = 29
              Hint = 
                'Looks for files where we have SendMessage().'#13#10'  Returns the line' +
                '(s) where the text was found.'#13#10'  If the line contains the "WPARA' +
                'M" and "LPARAM" keywords, it is ignored (because it is valid).'#13#10 +
                '  Same, if the parameters are 0,0.'#13#10#13#10'Global search (more relaxe' +
                'd).  This could give lots of false positive results, but it is s' +
                'till useful to search for possible invalid code.'
              Align = alLeft
              Caption = 'Search SendMessage (global)'
              TabOrder = 0
              OnClick = StartSearch
            end
            object btnSendMsgTypeCst: TButton
              Tag = 50
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 143
              Height = 29
              Hint = 
                'A more restricted search (no fake positive results).'#13#10#13#10'Looks fo' +
                'r files where we have SendMessage() and invalid typecasts are fo' +
                'und.'#13#10'  We look especially for things like:'#13#10'     SendMessage(hW' +
                'nd, WM_SETTEXT, 0, Integer(@MyCharArray));'#13#10'     SendMessage(hWn' +
                'd, WM_SETTEXT, 0, LongInt(@MyCharArray));'#13#10#13#10'Search in all files' +
                ' in the specified folder.'
              Align = alLeft
              Caption = 'Search SendMessage'
              TabOrder = 1
              WordWrap = True
              OnClick = StartSearch
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Replace Pointer()'
          ImageIndex = 5
          object Label13: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 26
            Width = 898
            Height = 17
            Align = alTop
            Alignment = taRightJustify
            Caption = 'Replaces Pointer(Integer and Pointer(LongInt'
          end
          object Label14: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 898
            Height = 17
            Align = alTop
            Alignment = taRightJustify
            Caption = '64 bit migration'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel6: TPanel
            Left = 0
            Top = 53
            Width = 904
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 904
              Height = 35
              Align = alBottom
              BevelOuter = bvNone
              ShowCaption = False
              TabOrder = 0
              object Button2: TButton
                Tag = 61
                AlignWithMargins = True
                Left = 144
                Top = 3
                Width = 135
                Height = 29
                Hint = 'Replace "SetFocus" in all PAS files in the specified folder'
                Align = alLeft
                Caption = 'Replace'
                TabOrder = 0
                OnClick = StartSearch
              end
              object btnPointer2: TButton
                Tag = 62
                AlignWithMargins = True
                Left = 285
                Top = 3
                Width = 135
                Height = 29
                Hint = 
                  ' Search possible pointer typecasts that are invalid.'#13#10'  In other' +
                  ' words find anything that is not "Pointer(NativeInt" or  "Pointe' +
                  'r(NativeUInt".'#13#10'  This can retun lots of fake positive results.'#13 +
                  #10#13#10'  Replace is not possible.'
                Align = alLeft
                Caption = 'Search (relaxed)'
                TabOrder = 1
                OnClick = StartSearch
              end
              object btnPointer1: TButton
                Tag = 60
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 135
                Height = 29
                Align = alLeft
                Caption = 'Search pointer casts'
                TabOrder = 2
                OnClick = StartSearch
              end
              object Button3: TButton
                Tag = 63
                AlignWithMargins = True
                Left = 426
                Top = 3
                Width = 147
                Height = 29
                Hint = 
                  'Find possible LongInt typecasts.'#13#10'  On Windows, LongInt is alway' +
                  's 32bit!'
                Align = alLeft
                Caption = 'Search LongInt casts'
                TabOrder = 3
                OnClick = StartSearch
              end
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'TComponent.Perform'
          ImageIndex = 5
          object Label15: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 898
            Height = 17
            Align = alTop
            Alignment = taRightJustify
            Caption = '64 bit migration - Winapi Issues'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel5: TPanel
            Left = 0
            Top = 53
            Width = 904
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnPerform: TButton
              Tag = 52
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 192
              Height = 29
              Align = alLeft
              Caption = 'Search TComponent.Perform'
              TabOrder = 0
              OnClick = StartSearch
            end
          end
        end
        object TabSheet12: TTabSheet
          Caption = 'PostMessage'
          ImageIndex = 3
          object Label16: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 898
            Height = 17
            Align = alTop
            Alignment = taRightJustify
            Caption = '64 bit migration - Winapi Issues'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 26
            Width = 898
            Height = 17
            Align = alTop
            Alignment = taRightJustify
            Caption = 'Looks for files where we have PostMessage().'
          end
          object Panel7: TPanel
            Left = 0
            Top = 53
            Width = 904
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnPostMsg: TButton
              Tag = 53
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 143
              Height = 29
              Hint = 
                'A more restricted search (no fake positive results).'#13#10#13#10'Looks fo' +
                'r files where we have SendMessage() and invalid typecasts are fo' +
                'und.'#13#10'  We look especially for things like:'#13#10'     PostMessage(hW' +
                'nd, WM_SETTEXT, 0, Integer(@MyCharArray));'#13#10'     PostMessage(hWn' +
                'd, WM_SETTEXT, 0, LongInt(@MyCharArray));'
              Align = alLeft
              Caption = 'Search PostMessage'
              TabOrder = 0
              WordWrap = True
              OnClick = StartSearch
            end
          end
        end
        object tabSetWinLong: TTabSheet
          Caption = 'SetWindowLong'
          ImageIndex = 4
          object Panel8: TPanel
            Left = 0
            Top = 53
            Width = 904
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnWinLong: TButton
              Tag = 71
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 143
              Height = 29
              Hint = 
                'Search SetWindowLong/GetWindowLog .'#13#10#13#10'Replace SetWindowLong/Get' +
                'WindowLog with SetWindowLongPtr/GetWindowLongPtr for GWLP_HINSTA' +
                'NCE, GWLP_ID, GWLP_USERDATA, GWLP_HWNDPARENT and GWLP_WNDPROC as' +
                ' they return pointers and handles. Pointers that are passed to S' +
                'etWindowLongPtr should be type-casted to LONG_PTR and not to Int' +
                'eger/Longint.'#13#10#13#10'    Wrong:'#13#10'        SetWindowLong(hWnd, GWL_WND' +
                'PROC, Longint(@MyWindowProc));'#13#10#13#10'    Correct:'#13#10'        SetWindo' +
                'wLongPtr(hWnd, GWLP_WNDPROC, LONG_PTR(@MyWindowProc));'#13#10
              Align = alLeft
              Caption = 'Find SetWindowLong'
              TabOrder = 0
              WordWrap = True
              OnClick = StartSearch
            end
          end
        end
      end
    end
    object tabFormater: TTabSheet
      Caption = 'Code formater'
      ImageIndex = 4
      object Panel9: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 912
        Height = 129
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object lblFormaterInfo: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 902
          Height = 34
          Align = alTop
          Alignment = taRightJustify
          Caption = 
            'Format the code in a compact way. For example '#39' := '#39' is replaced' +
            ' by '#39':='#39#13#10'Check the code to see what kind of formatting will be ' +
            'applied and change it to your liking. '
        end
        object Panel11: TPanel
          Left = 2
          Top = 92
          Width = 908
          Height = 35
          Align = alBottom
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          object btnStartFormat: TButton
            Tag = 80
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 125
            Height = 29
            Align = alLeft
            Caption = 'Start'
            TabOrder = 0
            OnClick = StartSearch
          end
        end
      end
    end
    object tabUTF: TTabSheet
      Caption = 'UTF8 conv'
      ImageIndex = -1
      object Panel4: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 912
        Height = 133
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object lblBomInfo: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 902
          Height = 17
          ParentCustomHint = False
          Align = alTop
          Alignment = taRightJustify
          Caption = 'Converts files between UTF and ANSI.'
        end
        object Panel10: TPanel
          Left = 2
          Top = 96
          Width = 908
          Height = 35
          Align = alBottom
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          object btnRemoveBOM: TButton
            Tag = 8
            AlignWithMargins = True
            Left = 289
            Top = 3
            Width = 144
            Height = 29
            Hint = 'Replace "SetFocus" in all PAS files in the specified folder'
            Align = alLeft
            Caption = 'Convert UTF8 to ANSI'
            TabOrder = 0
            OnClick = StartSearch
          end
          object btnIsUTF: TButton
            Tag = 9
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 130
            Height = 29
            Hint = 'Shows if the files in the specified folder are UTF8 or not.'
            Align = alLeft
            Caption = 'Is UTF8?'
            TabOrder = 1
            OnClick = StartSearch
          end
          object btnAddBOM: TButton
            Tag = 7
            AlignWithMargins = True
            Left = 139
            Top = 3
            Width = 144
            Height = 29
            Hint = 'Replace "SetFocus" in all PAS files in the specified folder'
            Align = alLeft
            Caption = 'Convert ANSI to UTF8'
            TabOrder = 2
            OnClick = StartSearch
          end
        end
      end
    end
    object tabColorPick: TTabSheet
      Caption = 'Color picker'
      ImageIndex = 1
      DesignSize = (
        918
        767)
      object Label5: TLabel
        Left = 415
        Top = 375
        Width = 113
        Height = 17
        Anchors = []
        Caption = 'Dynamicaly created'
        Visible = False
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'DFM spell checker'
      ImageIndex = 5
      DesignSize = (
        918
        767)
      object Label9: TLabel
        Left = 414
        Top = 375
        Width = 93
        Height = 17
        Anchors = []
        Caption = 'To come soon...'
      end
    end
    object TabSheet11: TTabSheet
      Caption = 'Fix CRLF'
      ImageIndex = 6
      DesignSize = (
        918
        767)
      object Button5: TButton
        Left = 293
        Top = 314
        Width = 269
        Height = 37
        Anchors = []
        Caption = 'Fix CRLF'
        TabOrder = 0
        OnClick = Button5Click
      end
    end
  end
  object PopupMenu: TPopupMenu
    Left = 451
    Top = 34
    object mnuCopyName: TMenuItem
      Caption = 'Copy filename'
      OnClick = mnuCopyNameClick
    end
    object mnuOpen: TMenuItem
      Caption = 'Open'
    end
  end
  object TimerRew: TTimer
    Enabled = False
    Interval = 4000
    OnTimer = TimerRewTimer
    Left = 547
    Top = 38
  end
end
