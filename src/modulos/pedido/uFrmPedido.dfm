object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 540
  ClientWidth = 1036
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1036
    Height = 61
    Align = alTop
    Color = clHighlight
    ParentBackground = False
    TabOrder = 0
    object img01: TImage
      Left = 975
      Top = 1
      Width = 60
      Height = 59
      Align = alRight
      ExplicitLeft = 760
      ExplicitHeight = 41
    end
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 21
      Top = 4
      Width = 951
      Height = 53
      Margins.Left = 20
      Align = alClient
      Caption = 'Pedido de Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 159
      ExplicitHeight = 25
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 494
    Width = 1036
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 398
    ExplicitWidth = 1063
    object btnSalvar: TButton
      AlignWithMargins = True
      Left = 403
      Top = 10
      Width = 100
      Height = 26
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = '&Salvar'
      TabOrder = 0
      ExplicitLeft = 536
      ExplicitHeight = 30
    end
    object btnEditar: TButton
      AlignWithMargins = True
      Left = 509
      Top = 10
      Width = 100
      Height = 26
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = '&Editar'
      TabOrder = 1
      ExplicitLeft = 642
      ExplicitHeight = 30
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 721
      Top = 10
      Width = 100
      Height = 26
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = '&Cancelar'
      TabOrder = 2
      ExplicitLeft = 854
      ExplicitHeight = 30
    end
    object btnExcluir: TButton
      AlignWithMargins = True
      Left = 615
      Top = 10
      Width = 100
      Height = 26
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = 'E&xcluir'
      TabOrder = 3
      ExplicitLeft = 748
      ExplicitHeight = 30
    end
    object btnFechar: TButton
      AlignWithMargins = True
      Left = 933
      Top = 10
      Width = 100
      Height = 26
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = '&Fechar'
      TabOrder = 4
      ExplicitLeft = 960
      ExplicitHeight = 30
    end
    object btnNovo: TButton
      AlignWithMargins = True
      Left = 297
      Top = 10
      Width = 100
      Height = 26
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = '&Novo'
      TabOrder = 5
      ExplicitLeft = 430
      ExplicitHeight = 30
    end
    object btnListagem: TButton
      AlignWithMargins = True
      Left = 827
      Top = 10
      Width = 100
      Height = 26
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = '&Listagem'
      TabOrder = 6
      ExplicitLeft = 824
      ExplicitTop = 13
    end
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 61
    Width = 1036
    Height = 433
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitLeft = -1
    ExplicitTop = 45
    ExplicitWidth = 821
    ExplicitHeight = 334
    object pgcPrincipal: TPageControl
      Left = 0
      Top = 0
      Width = 1036
      Height = 433
      ActivePage = tsListagem
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 995
      ExplicitHeight = 391
      object tsListagem: TTabSheet
        Caption = 'Listagem'
        object pnlPesquisa: TPanel
          Left = 0
          Top = 0
          Width = 1028
          Height = 81
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          ExplicitLeft = 3
          ExplicitTop = -6
        end
        object dbgrdDados: TDBGrid
          Left = 0
          Top = 81
          Width = 1028
          Height = 324
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object tsDados: TTabSheet
        Caption = 'Dados'
        ImageIndex = 1
        object pnlTotalizacao: TPanel
          Left = 0
          Top = 364
          Width = 1028
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          ExplicitTop = 382
          object lblTotalPedido: TLabel
            AlignWithMargins = True
            Left = 732
            Top = 3
            Width = 143
            Height = 35
            Align = alRight
            Alignment = taCenter
            Caption = 'Total do Pedido :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = 788
            ExplicitTop = 0
            ExplicitHeight = 23
          end
          object lblValortotal: TLabel
            AlignWithMargins = True
            Left = 881
            Top = 3
            Width = 144
            Height = 35
            Align = alRight
            Alignment = taRightJustify
            Caption = 'R$ 0,0000'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = 840
          end
        end
        object grpDadosPedido: TGroupBox
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 1008
          Height = 89
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alTop
          Caption = 'grpDadosPedido'
          TabOrder = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 1028
          object lblCodigo: TLabel
            Left = 17
            Top = 21
            Width = 43
            Height = 13
            Caption = 'lblCodigo'
          end
          object dbedtCodigo: TDBEdit
            Left = 17
            Top = 40
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object dbedtCliente: TDBEdit
            Left = 144
            Top = 40
            Width = 121
            Height = 21
            TabOrder = 1
          end
        end
        object dbgrdDadosPedido: TDBGrid
          Left = 0
          Top = 109
          Width = 1028
          Height = 255
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
  end
end