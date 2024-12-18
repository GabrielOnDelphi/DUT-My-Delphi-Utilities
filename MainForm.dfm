object frmMain: TfrmMain
  Left = 286
  Top = 124
  AlphaBlend = True
  AlphaBlendValue = 250
  Caption = 'LDU (Light Delphi Utilities) - Gabriel Moraru 2022'
  ClientHeight = 300
  ClientWidth = 980
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  SnapBuffer = 3
  OnDestroy = FormDestroy
  TextHeight = 17
  object CardPanel: TCardPanel
    Left = 185
    Top = 0
    Width = 795
    Height = 300
    Align = alClient
    ActiveCard = crdUtils
    Caption = 'CardPanel'
    TabOrder = 0
    object crdSearch: TCard
      Left = 1
      Top = 1
      Width = 793
      Height = 298
      Caption = 'Search'
      CardIndex = 0
      TabOrder = 0
      object pnlMethod: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 787
        Height = 150
        Align = alTop
        TabOrder = 0
        DesignSize = (
          787
          150)
        object Label6: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 779
          Height = 17
          Align = alTop
          Caption = 
            'Search all selected files for the class that implements the inte' +
            'rface below:'
        end
        object edtMethod: TLabeledEdit
          Left = 60
          Top = 78
          Width = 166
          Height = 25
          Hint = 'Enter the name of the method that you are searching for'
          Anchors = [akLeft, akBottom]
          EditLabel.Width = 82
          EditLabel.Height = 17
          EditLabel.Caption = 'Method name'
          TabOrder = 0
          Text = ''
          TextHint = 'MyMethod'
        end
        object Button4: TButton
          Tag = 1
          AlignWithMargins = True
          Left = 644
          Top = 106
          Width = 125
          Height = 32
          Hint = 
            'Search in all files for the class that implements the specified ' +
            'interface.'
          Anchors = [akRight, akBottom]
          Caption = 'Search'
          TabOrder = 1
          OnClick = StartSearch2
        end
        object chkIntfName: TCheckBox
          AlignWithMargins = True
          Left = 60
          Top = 117
          Width = 193
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = 'Class implements interface:'
          TabOrder = 2
        end
        object edtIntfName: TEdit
          Left = 245
          Top = 112
          Width = 121
          Height = 25
          Anchors = [akLeft, akBottom]
          TabOrder = 3
          TextHint = 'IMyInterface'
        end
      end
    end
    object crdUpgradeCode: TCard
      Left = 1
      Top = 1
      Width = 793
      Height = 298
      Caption = 'Upgrade code'
      CardIndex = 1
      TabOrder = 1
      object PageControl3: TPageControl
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 787
        Height = 193
        ActivePage = tabTryExcept
        Align = alTop
        TabOrder = 0
        object tabTryExcept: TTabSheet
          Caption = 'Try/Except'
          object Label3: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 212
            Height = 17
            Align = alTop
            Caption = 'Finds all try/except lines. See details.'
            WordWrap = True
          end
          object Panel2: TPanel
            Left = 0
            Top = 126
            Width = 779
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
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
              TabOrder = 0
              OnClick = StartSearch2
            end
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
              TabOrder = 1
              OnClick = StartSearch2
            end
            object btnHelp1: TButton
              AlignWithMargins = True
              Left = 684
              Top = 3
              Width = 92
              Height = 29
              Align = alRight
              Caption = 'Details'
              TabOrder = 2
              OnClick = btnHelp1Click
            end
          end
        end
        object tabSetFocus: TTabSheet
          Caption = 'SetFocus'
          ImageIndex = 1
          object Label4: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 507
            Height = 17
            Align = alTop
            Caption = 
              'SetFocus is broken in Delphi. Replaces MyControl.SetFocus with a' +
              ' my better alternative.'
            WordWrap = True
          end
          object Panel3: TPanel
            Left = 0
            Top = 126
            Width = 779
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
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
              OnClick = StartSearch2
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
              OnClick = StartSearch2
            end
            object btnHelp2: TButton
              AlignWithMargins = True
              Left = 689
              Top = 3
              Width = 87
              Height = 29
              Align = alRight
              Caption = 'Details'
              TabOrder = 2
              OnClick = btnHelp2Click
            end
          end
        end
      end
    end
    object crdWin64: TCard
      Left = 1
      Top = 1
      Width = 793
      Height = 298
      Caption = 'Win64'
      CardIndex = 2
      TabOrder = 2
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 9
        Width = 787
        Height = 17
        Margins.Top = 9
        Align = alTop
        Caption = 'Tools for 64 bit migration'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pgWin64: TPageControl
        AlignWithMargins = True
        Left = 3
        Top = 29
        Width = 787
        Height = 237
        Margins.Bottom = 17
        ActivePage = tabPointerInteger
        Align = alTop
        TabOrder = 0
        object tabExtended: TTabSheet
          AlignWithMargins = True
          Caption = 'Extended'
          ImageIndex = 5
          object Label7: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 97
            Height = 17
            Align = alTop
            Caption = 'Extended issues'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 26
            Width = 628
            Height = 85
            Align = alTop
            Caption = 
              #13#10'On Win32, the size of System.Extended type is 10 bytes. '#13#10'Howe' +
              'ver, on Win64, the System.Extended type is an alias for System.D' +
              'ouble, which is only 8 bytes! '#13#10'There is no 10-byte equivalent f' +
              'or Extended on 64-bit. '#13#10'Under normal circumstances, this does n' +
              'ot create huge problems, except for a sligly precision degradati' +
              'on.'
            WordWrap = True
          end
          object Panel7: TPanel
            Left = 0
            Top = 164
            Width = 773
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnExtended: TButton
              Tag = 72
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 228
              Height = 29
              Hint = 'It is recommended to replace Extended with Double.'
              Align = alLeft
              Caption = 'Find Extended'
              TabOrder = 0
              WordWrap = True
              OnClick = StartSearch2
            end
          end
        end
        object tabExtendedRec: TTabSheet
          Caption = 'Extended Rec'
          ImageIndex = 6
          object Label11: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 208
            Height = 17
            Align = alTop
            Caption = 'Extended issues in packed records'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 26
            Width = 772
            Height = 136
            Align = alTop
            Caption = 
              #13#10'On Win32, the size of System.Extended type is 10 bytes. Howeve' +
              'r, on Win64, the System.Extended type is an alias for System.Dou' +
              'ble, which is only 8 bytes! There is no 10-byte equivalent for E' +
              'xtended on 64-bit. Under normal circumstances, this does not cre' +
              'ate huge problems.'#13#10#13#10'However, packed records are usually used w' +
              'hen data is read or written from disk.'#13#10'If such a record has an ' +
              'Extended in it, then data corruption is likely to occur because ' +
              'under Win32 you will read 10 bytes, while under Win64 you will r' +
              'ead 8 bytes.'
            WordWrap = True
          end
          object Panel9: TPanel
            Left = 0
            Top = 170
            Width = 779
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnExtendedRec: TButton
              Tag = 73
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 228
              Height = 29
              Hint = 
                'Find packed records that have an '#39'Extended'#39' fields.'#13#10'The "packed' +
                '" keyword can indicate that the record might be saved to disk.'#13#10 +
                'In this case we need to make sure that the size of the data rema' +
                'ins the same, no matter if we are on Win32 or Win 64.'
              Align = alLeft
              Caption = 'Find Extended in Packed Records'
              TabOrder = 0
              WordWrap = True
              OnClick = StartSearch2
            end
          end
        end
        object tabPointerInteger: TTabSheet
          Caption = 'Find invalid typecasts'
          ImageIndex = 5
          object Label10: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 26
            Width = 538
            Height = 85
            Align = alTop
            Caption = 
              #13#10'On Win64 we cannot assume anymore that SizeOf(Pointer)=SizeOf(' +
              'Integer/Cardinal/Longint).'#13#10#13#10'This tool searches for invalid poi' +
              'nter typecasts such as '#13#10'   Pointer(Integer,  Pointer(PInteger, ' +
              ' Pointer(Cardinal,  etc, and recomends fixes.'
          end
          object lblPtrIssues: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 139
            Height = 17
            Align = alTop
            Caption = 'Pointer typecast issues'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel6: TPanel
            Left = 0
            Top = 170
            Width = 779
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 779
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
                OnClick = StartSearch2
              end
              object btnPointer2: TButton
                Tag = 62
                AlignWithMargins = True
                Left = 641
                Top = 3
                Width = 135
                Height = 29
                Hint = 
                  'Lists all pointer typecasts execept the valid ones, such as "Poi' +
                  'nter(NativeInt" or "Pointer(NativeUInt".'#13#10'Useful if you want to ' +
                  'manually inspect ALL pointer typecasts in your code (which you s' +
                  'hould do). '#13#10#13#10'Replace is not possible.'
                Align = alRight
                Caption = 'Search (relaxed)'
                TabOrder = 1
                OnClick = StartSearch2
              end
              object btnPointer1: TButton
                Tag = 60
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 135
                Height = 29
                Hint = 'Searches for "Pointer(Integer(" and similar issues.'
                Align = alLeft
                Caption = 'Search pointer casts'
                TabOrder = 2
                OnClick = StartSearch2
              end
            end
          end
        end
        object tabPointerLongInt: TTabSheet
          Caption = 'Find LongInt typecasts'
          ImageIndex = 5
          object Label18: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 26
            Width = 436
            Height = 68
            Align = alTop
            Caption = 
              #13#10'On Windows, LongInt is always 32bit. We cannot use it in point' +
              'er typecasts.'#13#10#13#10'This tool find invalid LongInt/PLongInt typecas' +
              'ts.'
          end
          object Label12: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 139
            Height = 17
            Align = alTop
            Caption = 'Pointer typecast issues'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel4: TPanel
            Left = 0
            Top = 170
            Width = 779
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object Button11: TButton
              Tag = 63
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 147
              Height = 29
              Hint = 
                'Find possible LongInt/PLongInt typecasts.'#13#10'On Windows, LongInt i' +
                's always 32bit!'
              Align = alLeft
              Caption = 'Search LongInt casts'
              TabOrder = 0
              OnClick = StartSearch2
            end
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'SendMessage'
          object Label2: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 26
            Width = 470
            Height = 119
            Align = alTop
            Caption = 
              #13#10'Searches invalid typecasts in the parameters of SendMessage(),' +
              ' PostMessage()...'#13#10'This tool could give some false positive resu' +
              'lts.'#13#10#13#10'Accepted code formatting:'#13#10'  SendMessage(x, 0, 0);'#13#10'  Se' +
              'ndMessage(x,0,0);'
          end
          object lblWinApiIssues: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 83
            Height = 17
            Align = alTop
            Caption = 'Winapi Issues'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pnlButtons: TPanel
            Left = 0
            Top = 170
            Width = 779
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
              Caption = 'Search (global)'
              TabOrder = 0
              OnClick = StartSearch2
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
              Caption = 'Search'
              TabOrder = 1
              WordWrap = True
              OnClick = StartSearch2
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'TComponent.Perform'
          ImageIndex = 5
          object lblWinApiIssues2: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 83
            Height = 17
            Align = alTop
            Caption = 'Winapi Issues'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 26
            Width = 497
            Height = 136
            Align = alTop
            Caption = 
              #13#10'Searches for invalid typecasts in the parameters of the TCompo' +
              'nent.Perform method.'#13#10'This tool could give some false positive r' +
              'esults.'#13#10#13#10'Accepted code formatting:'#13#10'  .Perform(x, 0, 0);'#13#10'  .P' +
              'erform(x,0,0);'#13#10
          end
          object Panel5: TPanel
            Left = 0
            Top = 170
            Width = 779
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnPerform: TButton
              Tag = 51
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 192
              Height = 29
              Align = alLeft
              Caption = 'Search TComponent.Perform'
              TabOrder = 0
              OnClick = StartSearch2
            end
          end
        end
        object tabSetWinLong: TTabSheet
          Caption = 'SetWindowLong'
          ImageIndex = 4
          object lblWinApiIssues3: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 83
            Height = 17
            Align = alTop
            Caption = 'Winapi Issues'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 26
            Width = 651
            Height = 34
            Align = alTop
            Caption = 
              #13#10'On Win64, SetWindowLong and GetWindowLong must be replaced wit' +
              'h SetWindowLongPtr/GetWindowLongPtr.'
          end
          object Panel8: TPanel
            Left = 0
            Top = 170
            Width = 779
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnWinLong: TButton
              Tag = 52
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
              OnClick = StartSearch2
            end
          end
        end
      end
    end
    object crdFileFormat: TCard
      Left = 1
      Top = 1
      Width = 793
      Height = 298
      Caption = 'File Format'
      CardIndex = 3
      TabOrder = 3
      object PageControl2: TPageControl
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 787
        Height = 193
        ActivePage = tabUTF
        Align = alTop
        TabOrder = 0
        object tabUTF: TTabSheet
          Caption = 'ANSI/UTF conversion'
          ImageIndex = 1
          object Label5: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 218
            Height = 17
            ParentCustomHint = False
            Align = alTop
            Caption = 'Converts files between UTF and ANSI.'
          end
          object Panel13: TPanel
            Left = 0
            Top = 126
            Width = 779
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object Button5: TButton
              Tag = 8
              AlignWithMargins = True
              Left = 289
              Top = 3
              Width = 144
              Height = 29
              Align = alLeft
              Caption = 'Convert UTF8 to ANSI'
              TabOrder = 0
              OnClick = StartSearch2
            end
            object Button6: TButton
              Tag = 9
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 130
              Height = 29
              Hint = 'Shows if the files in the specified folder have BOM or not.'
              Align = alLeft
              Caption = 'Has BOM?'
              TabOrder = 1
              OnClick = StartSearch2
            end
            object Button7: TButton
              Tag = 7
              AlignWithMargins = True
              Left = 139
              Top = 3
              Width = 144
              Height = 29
              Hint = 'Converts ANSI file to UTF8 and adds BOM to the file.'
              Align = alLeft
              Caption = 'Convert ANSI to UTF8'
              TabOrder = 2
              OnClick = StartSearch2
            end
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'Fix CRLF'
          ImageIndex = 2
          object lblBomInfo: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 154
            Height = 17
            ParentCustomHint = False
            Align = alTop
            Caption = 'Fix invalid CRLF in PAS files'
          end
          object Panel10: TPanel
            Left = 0
            Top = 126
            Width = 779
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnFixEnters: TButton
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 123
              Height = 29
              Align = alLeft
              Caption = 'Fix CRLF'
              TabOrder = 0
              OnClick = btnFixEntersClick
            end
          end
        end
        object tabFormatCode: TTabSheet
          Caption = 'Format source code'
          object lblFormaterInfo: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 528
            Height = 34
            Align = alTop
            Caption = 
              'Format the code in a compact way. For example '#39' := '#39' is replaced' +
              ' by '#39':='#39#13#10'Check the code to see what kind of formatting will be ' +
              'applied and change it to your liking. '
            WordWrap = True
          end
          object Panel11: TPanel
            Left = 0
            Top = 122
            Width = 779
            Height = 39
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
              Height = 33
              Align = alLeft
              Caption = 'Start'
              TabOrder = 0
              OnClick = StartSearch2
            end
          end
        end
      end
    end
    object crdSpellCheck: TCard
      Left = 1
      Top = 1
      Width = 793
      Height = 298
      Caption = 'SpellCheck'
      CardIndex = 4
      TabOrder = 4
      DesignSize = (
        793
        298)
      object Label9: TLabel
        Left = 346
        Top = 142
        Width = 92
        Height = 17
        Anchors = []
        Caption = 'To come soon...'
      end
    end
    object crdUtils: TCard
      Left = 1
      Top = 1
      Width = 793
      Height = 298
      Caption = 'Utils'
      CardIndex = 5
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 5
      DesignSize = (
        793
        298)
      object lblDynamicalyCreated: TLabel
        Left = 363
        Top = 150
        Width = 113
        Height = 17
        Anchors = []
        Caption = 'Dynamicaly created'
        Visible = False
      end
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 300
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object lblHomePage: TInternetLabel
      AlignWithMargins = True
      Left = 3
      Top = 282
      Width = 179
      Height = 15
      Cursor = crHandPoint
      Align = alBottom
      Alignment = taCenter
      Caption = 'More'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Link = 'https://gabrielmoraru.com'
      LinkHint = False
      Visited = False
      VisitedColor = clPurple
      NotVisitedColor = clBlue
      OverColor = clRed
    end
    object Categories: TCategoryPanelGroup
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 179
      Height = 180
      VertScrollBar.Tracking = True
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -12
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = []
      ParentBackground = True
      ParentColor = True
      TabOrder = 0
      object cpMain: TCategoryPanel
        Top = 0
        Height = 176
        Caption = 'Tools'
        TabOrder = 0
        object btnFileFormat: TButton
          Tag = 4
          AlignWithMargins = True
          Left = 3
          Top = 90
          Width = 167
          Height = 23
          Align = alTop
          Caption = 'Fix file format'
          TabOrder = 0
          OnClick = SwitchCard
        end
        object btnSearch: TButton
          Tag = 1
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 167
          Height = 23
          Hint = 'Find which classes implements the specified interface'
          Align = alTop
          Caption = 'Interface implementation'
          TabOrder = 1
          OnClick = SwitchCard
        end
        object btnMigrate: TButton
          Tag = 2
          AlignWithMargins = True
          Left = 3
          Top = 32
          Width = 167
          Height = 23
          Align = alTop
          Caption = 'Upgrade to Win64'
          TabOrder = 2
          OnClick = SwitchCard
        end
        object btnUpgrade: TButton
          Tag = 3
          AlignWithMargins = True
          Left = 3
          Top = 61
          Width = 167
          Height = 23
          Align = alTop
          Caption = 'Improve code'
          TabOrder = 3
          OnClick = SwitchCard
        end
        object btnUtils: TButton
          Tag = 5
          AlignWithMargins = True
          Left = 3
          Top = 119
          Width = 167
          Height = 23
          Align = alTop
          Caption = 'Utils'
          TabOrder = 4
          OnClick = SwitchCard
        end
      end
    end
    object btnSettings: TButton
      Tag = 3
      AlignWithMargins = True
      Left = 3
      Top = 248
      Width = 179
      Height = 28
      Align = alBottom
      Caption = 'Settings'
      TabOrder = 1
      OnClick = btnSettingsClick
    end
    object Button3: TButton
      Tag = 3
      AlignWithMargins = True
      Left = 3
      Top = 214
      Width = 179
      Height = 28
      Align = alBottom
      Caption = 'Show results'
      TabOrder = 2
      Visible = False
      OnClick = Button3Click
    end
  end
end
