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
    Left = 210
    Top = 117
    Width = 3
    Height = 13
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
    Color = cl3DDkShadow
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
    Left = 8
    Top = 10
    Width = 80
    Height = 17
    Caption = 'Write To File'
    Color = clMedGray
    ParentColor = False
    TabOrder = 5
    OnClick = cbWriteToFileClick
  end
  object cbReadfromFile: TCheckBox
    Left = 8
    Top = 33
    Width = 96
    Height = 17
    Caption = 'Read From File'
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
    Left = 312
    Top = 8
    Width = 121
    Height = 21
    Color = clMoneyGreen
    ReadOnly = True
    TabOrder = 8
  end
  object edtPassword: TEdit
    Left = 8
    Top = 114
    Width = 193
    Height = 21
    Color = cl3DDkShadow
    TabOrder = 9
    TextHint = 'Enter Password here'
    OnChange = edtPasswordChange
  end
  object btnLinkToHTML: TButton
    Left = 691
    Top = 616
    Width = 86
    Height = 25
    Caption = 'Open Website'
    TabOrder = 10
    OnClick = btnLinkToHTMLClick
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 16
    Top = 600
  end
end
