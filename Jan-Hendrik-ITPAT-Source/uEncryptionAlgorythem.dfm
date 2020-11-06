object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Jan-Hendrik ITPAT'
  ClientHeight = 649
  ClientWidth = 798
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = StartupSetup
  PixelsPerInch = 96
  TextHeight = 13
  object lblannotationsyntax: TLabel
    Left = 89
    Top = 68
    Width = 387
    Height = 13
    Caption = 
      'To add an annotation to you text use the following syntax : /*yo' +
      'ur annotation*\'
    Color = clBtnText
    ParentColor = False
  end
  object lblStrengthscore: TLabel
    Left = 365
    Top = 117
    Width = 76
    Height = 13
  end
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 47
    Height = 13
    Caption = 'Optional :'
  end
  object Label2: TLabel
    Left = 8
    Top = 117
    Width = 145
    Height = 13
    Caption = 'Password for encrypted text :'
  end
  object Label3: TLabel
    Left = 256
    Top = 213
    Width = 241
    Height = 13
    Caption = 'You can copy the text out of the box below :'
  end
  object RedtOutput: TRichEdit
    Left = 8
    Top = 232
    Width = 769
    Height = 361
    Hint = 'output richedit'
    Color = cl3DDkShadow
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HideSelection = False
    HideScrollBars = False
    Lines.Strings = (
      'RedtOutput')
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 0
    Zoom = 100
  end
  object edtPlaintextinput: TEdit
    Left = 8
    Top = 87
    Width = 769
    Height = 21
    Color = clGrayText
    TabOrder = 1
    TextHint = 'Text to Encrypt'
  end
  object btnProcess: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = ' Encrypt '
    TabOrder = 2
    OnClick = btnProcessClick
  end
  object btnDecrypt: TButton
    Left = 8
    Top = 151
    Width = 75
    Height = 25
    Caption = 'Decrypt '
    TabOrder = 3
    OnClick = btnDecryptClick
  end
  object edtDecrypt: TEdit
    Left = 8
    Top = 182
    Width = 769
    Height = 21
    Color = cl3DDkShadow
    TabOrder = 4
    TextHint = 'Text to Decrypt'
  end
  object cbWriteToFile: TCheckBox
    Left = 61
    Top = 31
    Width = 132
    Height = 16
    Caption = 'Write To external File'
    Color = clMedGray
    ParentColor = False
    TabOrder = 5
    OnClick = cbWriteToFileClick
  end
  object cbReadfromFile: TCheckBox
    Left = 61
    Top = 8
    Width = 140
    Height = 17
    Caption = 'Read From external File'
    TabOrder = 6
    OnClick = cbReadfromFileClick
  end
  object btnClearFile: TButton
    Left = 640
    Top = 8
    Width = 150
    Height = 25
    Caption = 'Clear Selected Read Text File'
    TabOrder = 7
    OnClick = btnClearFileClick
  end
  object edtClock: TEdit
    Left = 320
    Top = 17
    Width = 121
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 8
  end
  object edtPassword: TEdit
    Left = 159
    Top = 114
    Width = 193
    Height = 21
    Color = cl3DDkShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    TextHint = 'Enter Password here'
    OnChange = edtPasswordChange
  end
  object bmbLinkToHTML: TBitBtn
    Left = 640
    Top = 599
    Width = 137
    Height = 25
    Caption = 'Open Website for Help'
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 10
    OnClick = bmbLinkToHTMLClick
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 16
    Top = 600
  end
end
