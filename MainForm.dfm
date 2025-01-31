object frmMain: TfrmMain
  Left = 286
  Top = 124
  AlphaBlend = True
  AlphaBlendValue = 250
  Caption = 'LDU (Light Delphi Utilities) - Gabriel Moraru 2022'
  ClientHeight = 611
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
  object lblDescription: TLabel
    AlignWithMargins = True
    Left = 191
    Top = 8
    Width = 779
    Height = 185
    AutoSize = False
    Caption = 'Agent description'
    WordWrap = True
  end
  object CardPanel: TCardPanel
    Left = 195
    Top = 213
    Width = 776
    Height = 362
    ActiveCard = crdUpgradeCode
    Caption = 'CardPanel'
    TabOrder = 0
    object crdUpgradeCode: TCard
      Left = 1
      Top = 1
      Width = 774
      Height = 360
      Caption = 'Upgrade code'
      CardIndex = 0
      TabOrder = 0
      object PageControl3: TPageControl
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 768
        Height = 193
        ActivePage = tabFreeAndNil
        Align = alTop
        TabOrder = 0
        object tabTryExcept: TTabSheet
          Caption = 'Try/Except'
          object Label3: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 754
            Height = 17
            Align = alTop
            Caption = 'Finds all try/except lines. See details.'
            WordWrap = True
          end
          object Panel2: TPanel
            Left = 0
            Top = 126
            Width = 760
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnTryExcept: TButton
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
              OnClick = StartTask
            end
            object btnTryExcept2: TButton
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
              OnClick = StartTask
            end
            object btnHelp1: TButton
              AlignWithMargins = True
              Left = 665
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
            Width = 754
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
            Width = 760
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnSetFocus2: TButton
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
              OnClick = StartTask
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
              OnClick = StartTask
            end
            object btnHelp2: TButton
              AlignWithMargins = True
              Left = 670
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
        object tabFreeAndNil: TTabSheet
          Caption = 'FreeAndNil()'
          ImageIndex = 2
          object Label14: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 754
            Height = 17
            Align = alTop
            Caption = 'Replaces Object.Free with FreeAndNil(Object) which is safer.'
            WordWrap = True
          end
          object Panel12: TPanel
            Left = 0
            Top = 126
            Width = 760
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnFreeAndNil2: TButton
              Tag = 11
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
              OnClick = StartTask
            end
            object btnFreeAndNil: TButton
              Tag = 10
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 125
              Height = 29
              Hint = 'This will not change the files'
              Align = alLeft
              Caption = 'Search'
              TabOrder = 1
              OnClick = StartTask
            end
          end
        end
      end
    end
    object crdFileFormat: TCard
      Left = 1
      Top = 1
      Width = 774
      Height = 360
      Caption = 'File Format'
      CardIndex = 1
      TabOrder = 1
      object PageControl2: TPageControl
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 768
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
            Width = 754
            Height = 17
            ParentCustomHint = False
            Align = alTop
            Caption = 'Converts files between UTF and ANSI.'
          end
          object Panel13: TPanel
            Left = 0
            Top = 126
            Width = 760
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            object btnUtf2Ansi: TButton
              Tag = 8
              AlignWithMargins = True
              Left = 289
              Top = 3
              Width = 144
              Height = 29
              Align = alLeft
              Caption = 'Convert UTF8 to ANSI'
              TabOrder = 0
              OnClick = StartTask
            end
            object btnHasBom: TButton
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
              OnClick = StartTask
            end
            object btnAnsi2Utf: TButton
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
              OnClick = StartTask
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
            Width = 754
            Height = 17
            ParentCustomHint = False
            Align = alTop
            Caption = 'Fix invalid CRLF in PAS files'
          end
          object Panel10: TPanel
            Left = 0
            Top = 126
            Width = 760
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
            Width = 754
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
            Width = 760
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
              OnClick = StartTask
            end
          end
        end
      end
    end
    object crdSpellCheck: TCard
      Left = 1
      Top = 1
      Width = 774
      Height = 360
      Caption = 'SpellCheck'
      CardIndex = 2
      TabOrder = 2
      DesignSize = (
        774
        360)
      object Label9: TLabel
        Left = 335
        Top = 174
        Width = 92
        Height = 17
        Anchors = []
        Caption = 'To come soon...'
      end
    end
    object crdColorPicker: TCard
      Left = 1
      Top = 1
      Width = 774
      Height = 360
      Caption = 'Color Picker'
      CardIndex = 3
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      DesignSize = (
        774
        360)
      object lblDynamicalyCreated: TLabel
        Left = 351
        Top = 185
        Width = 113
        Height = 17
        Anchors = []
        Caption = 'Dynamicaly created'
        Visible = False
      end
    end
    object crdExtractCode: TCard
      Left = 1
      Top = 1
      Width = 774
      Height = 360
      Caption = 'crdExtractCode'
      CardIndex = 4
      TabOrder = 4
      object Panel14: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 768
        Height = 150
        Align = alTop
        TabOrder = 0
        DesignSize = (
          768
          150)
        object Label17: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 760
          Height = 17
          Align = alTop
          Caption = 
            'Search all files for the specified line of code and returns the ' +
            'collected results'
        end
        object LabeledEdit1: TLabeledEdit
          Left = 11
          Top = 69
          Width = 533
          Height = 25
          Hint = 'Search for'
          Anchors = [akLeft, akBottom]
          EditLabel.Width = 60
          EditLabel.Height = 17
          EditLabel.Caption = 'Search for'
          TabOrder = 0
          Text = ''
          TextHint = '{$IFDEF'
        end
        object btnSearchCode: TButton
          Tag = 13
          AlignWithMargins = True
          Left = 625
          Top = 106
          Width = 125
          Height = 32
          Hint = 
            'Search in all files for the class that implements the specified ' +
            'interface.'
          Anchors = [akRight, akBottom]
          Caption = 'Search'
          TabOrder = 1
          OnClick = StartTask
        end
      end
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 611
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object lblHomePage: TInternetLabel
      AlignWithMargins = True
      Left = 3
      Top = 593
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
      Height = 550
      VertScrollBar.Tracking = True
      Align = alClient
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
        Top = 114
        Height = 151
        Caption = 'Tools'
        TabOrder = 0
        object btnFileFormat: TButton
          Tag = 4
          AlignWithMargins = True
          Left = 3
          Top = 32
          Width = 167
          Height = 26
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Fix file format'
          TabOrder = 0
          OnClick = SwitchCard
        end
        object btnAgUpgrade: TButton
          Tag = 3
          AlignWithMargins = True
          Left = 3
          Top = 2
          Width = 167
          Height = 26
          Hint = 
            '1. Replaces TControl.SetFocus with a my better alternative.'#13#10'2. ' +
            'Finds all try/except lines. '#13#10'3. Replaces .Free with FreeAndNil(' +
            ')'
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Improve code'
          TabOrder = 1
          OnClick = SwitchCard
        end
        object btnColorPick: TButton
          Tag = 5
          AlignWithMargins = True
          Left = 3
          Top = 92
          Width = 167
          Height = 26
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Color picker'
          TabOrder = 2
          OnClick = SwitchCard
        end
        object btnExtractCode: TButton
          Tag = 5
          AlignWithMargins = True
          Left = 3
          Top = 62
          Width = 167
          Height = 26
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Find code'
          TabOrder = 3
          OnClick = SwitchCard
        end
      end
      object pnl64bit: TCategoryPanel
        Top = 265
        Height = 240
        Caption = '32 to 64-bit upgrade'
        TabOrder = 1
        object btnAgExtended: TButton
          Tag = 70
          AlignWithMargins = True
          Left = 3
          Top = 152
          Width = 167
          Height = 26
          Hint = 'It is recommended to replace Extended with Double.'
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Extended'
          TabOrder = 0
          WordWrap = True
          OnClick = StartTask
          OnMouseEnter = btnMouseEnter
        end
        object btnAgExtendedRec: TButton
          Tag = 71
          AlignWithMargins = True
          Left = 3
          Top = 182
          Width = 167
          Height = 26
          Hint = 
            'Find packed records that have an '#39'Extended'#39' fields.'#13#10'The "packed' +
            '" keyword can indicate that the record might be saved to disk.'#13#10 +
            'In this case we need to make sure that the size of the data rema' +
            'ins the same, no matter if we are on Win32 or Win 64.'
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Extended in Records'
          TabOrder = 1
          WordWrap = True
          OnClick = StartTask
          OnMouseEnter = btnMouseEnter
        end
        object btnAgPointer: TButton
          Tag = 60
          AlignWithMargins = True
          Left = 3
          Top = 92
          Width = 167
          Height = 26
          Hint = 'Searches for "Pointer(Integer(" and similar issues.'
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Invalid pointer casts'
          TabOrder = 2
          OnClick = StartTask
          OnMouseEnter = btnMouseEnter
        end
        object btnAgLongInt: TButton
          Tag = 61
          AlignWithMargins = True
          Left = 3
          Top = 122
          Width = 167
          Height = 26
          Hint = 
            'Find possible LongInt/PLongInt typecasts.'#13#10'On Windows, LongInt i' +
            's always 32bit!'
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'LongInt casts'
          TabOrder = 3
          OnClick = StartTask
          OnMouseEnter = btnMouseEnter
        end
        object btnAgSendMsgTypeCst: TButton
          Tag = 50
          AlignWithMargins = True
          Left = 3
          Top = 2
          Width = 167
          Height = 26
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'SendMessage'
          TabOrder = 4
          WordWrap = True
          OnClick = StartTask
          OnMouseEnter = btnMouseEnter
        end
        object btnAgPerform: TButton
          Tag = 51
          AlignWithMargins = True
          Left = 3
          Top = 32
          Width = 167
          Height = 26
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'TComponent.Perform'
          TabOrder = 5
          OnClick = StartTask
          OnMouseEnter = btnMouseEnter
        end
        object btnAgWinLong: TButton
          Tag = 52
          AlignWithMargins = True
          Left = 3
          Top = 62
          Width = 167
          Height = 26
          Hint = 
            'Search SetWindowLong/GetWindowLog .'#13#10#13#10'Replace SetWindowLong/Get' +
            'WindowLog with SetWindowLongPtr/GetWindowLongPtr for GWLP_HINSTA' +
            'NCE, GWLP_ID, GWLP_USERDATA, GWLP_HWNDPARENT and GWLP_WNDPROC as' +
            ' they return pointers and handles. Pointers that are passed to S' +
            'etWindowLongPtr should be type-casted to LONG_PTR and not to Int' +
            'eger/Longint.'#13#10#13#10'    Wrong:'#13#10'        SetWindowLong(hWnd, GWL_WND' +
            'PROC, Longint(@MyWindowProc));'#13#10#13#10'    Correct:'#13#10'        SetWindo' +
            'wLongPtr(hWnd, GWLP_WNDPROC, LONG_PTR(@MyWindowProc));'#13#10
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'SetWindowLong'
          TabOrder = 6
          WordWrap = True
          OnClick = StartTask
          OnMouseEnter = btnMouseEnter
        end
      end
      object CategoryPanel1: TCategoryPanel
        Top = 0
        Height = 114
        Caption = 'Search'
        TabOrder = 2
        object btnAgIntfImpl: TButton
          Tag = 1
          AlignWithMargins = True
          Left = 3
          Top = 2
          Width = 167
          Height = 26
          Hint = 
            'Search in all files for the class that implements the specified ' +
            'interface.'
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Interface implementor'
          TabOrder = 0
          Visible = False
          WordWrap = True
          OnClick = StartTask
          OnMouseEnter = btnMouseEnter
        end
        object btnAgFindCode: TButton
          Tag = 999
          AlignWithMargins = True
          Left = 3
          Top = 32
          Width = 167
          Height = 26
          Hint = 'List all lines of code that contains the specified item'
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Find code'
          TabOrder = 1
          WordWrap = True
          OnClick = StartTask
          OnMouseEnter = btnMouseEnter
        end
      end
    end
    object btnSettings: TButton
      Tag = 3
      AlignWithMargins = True
      Left = 3
      Top = 559
      Width = 179
      Height = 28
      Align = alBottom
      Caption = 'Global settings'
      TabOrder = 1
      OnClick = btnSettingsClick
    end
  end
  object pnlMethod: TPanel
    AlignWithMargins = True
    Left = 512
    Top = 371
    Width = 427
    Height = 129
    TabOrder = 2
    DesignSize = (
      427
      129)
    object Label6: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 419
      Height = 17
      Align = alTop
      Caption = 
        'Search all selected files for the class that implements the inte' +
        'rface below:'
    end
    object edtMethod: TLabeledEdit
      Left = 60
      Top = 57
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
    object chkIntfName: TCheckBox
      AlignWithMargins = True
      Left = 60
      Top = 96
      Width = 193
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Class implements interface:'
      TabOrder = 1
    end
    object edtIntfName: TEdit
      Left = 245
      Top = 91
      Width = 121
      Height = 25
      Anchors = [akLeft, akBottom]
      TabOrder = 2
      TextHint = 'IMyInterface'
    end
  end
  object AppEvents: TApplicationEvents
    Left = 312
    Top = 272
  end
end
