object FrmListCadastroTemplate: TFrmListCadastroTemplate
  Left = 0
  Top = 0
  ClientHeight = 383
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlListTopo: TPanel
    Left = 0
    Top = 0
    Width = 596
    Height = 41
    Align = alTop
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    object lbltitulo: TLabel
      Left = 1
      Top = 1
      Width = 193
      Height = 25
      Align = alClient
      Alignment = taCenter
      Caption = 'Listagem de Clientes'
      Color = clHighlightText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
  end
  object pnlListBase: TPanel
    Left = 0
    Top = 342
    Width = 596
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnFechar: TButton
      AlignWithMargins = True
      Left = 492
      Top = 4
      Width = 100
      Height = 33
      Action = actFechar
      Align = alRight
      TabOrder = 0
    end
    object btnConfirmar: TButton
      AlignWithMargins = True
      Left = 386
      Top = 4
      Width = 100
      Height = 33
      Action = actConfirmar
      Align = alRight
      TabOrder = 1
    end
  end
  object dbgrdDados: TDBGrid
    Left = 0
    Top = 41
    Width = 596
    Height = 301
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object QryDados: TFDQuery
    Left = 304
    Top = 144
  end
  object dsDados: TDataSource
    Left = 296
    Top = 200
  end
  object actlstDados: TActionList
    Left = 400
    Top = 184
    object actConfirmar: TAction
      Caption = '&Confirmar'
    end
    object actFechar: TAction
      Caption = 'Fechar (Esc)'
      ShortCut = 27
      OnExecute = actFecharExecute
    end
  end
end
