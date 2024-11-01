object FrmPedidoVenda: TFrmPedidoVenda
  Left = 0
  Top = 0
  Caption = 'Pedido de Venda'
  ClientHeight = 459
  ClientWidth = 958
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 958
    Height = 61
    Align = alTop
    Color = clHighlight
    ParentBackground = False
    TabOrder = 0
    object img01: TImage
      Left = 897
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
      Width = 873
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
    Top = 413
    Width = 958
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object btnGravarPedido: TButton
      AlignWithMargins = True
      Left = 537
      Top = 10
      Width = 100
      Height = 26
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = '&Gravar Pedido'
      TabOrder = 0
      OnClick = actGravarExecute
    end
    object btnEditar: TButton
      AlignWithMargins = True
      Left = 643
      Top = 10
      Width = 100
      Height = 26
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = '&Editar Pedido'
      TabOrder = 1
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 749
      Top = 10
      Width = 100
      Height = 26
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = '&Cancelar Pedido'
      TabOrder = 2
    end
    object btnFechar: TButton
      AlignWithMargins = True
      Left = 855
      Top = 10
      Width = 100
      Height = 26
      Margins.Top = 10
      Margins.Bottom = 10
      Action = actFechar
      Align = alRight
      TabOrder = 3
    end
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 61
    Width = 958
    Height = 352
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pnlTotalizacao: TPanel
      Left = 0
      Top = 311
      Width = 958
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object lblTotalPedido: TLabel
        AlignWithMargins = True
        Left = 722
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
        ExplicitHeight = 23
      end
      object lblValortotal: TLabel
        AlignWithMargins = True
        Left = 871
        Top = 3
        Width = 84
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
        ExplicitHeight = 23
      end
      object btnAddItem: TButton
        AlignWithMargins = True
        Left = 3
        Top = 10
        Width = 100
        Height = 21
        Margins.Top = 10
        Margins.Bottom = 10
        Align = alLeft
        Caption = '&Adicionar Item'
        TabOrder = 0
      end
      object btnRemoverItem: TButton
        AlignWithMargins = True
        Left = 109
        Top = 10
        Width = 100
        Height = 21
        Margins.Top = 10
        Margins.Bottom = 10
        Align = alLeft
        Caption = '&Remover Item'
        TabOrder = 1
      end
    end
    object grpDadosPedido: TGroupBox
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 938
      Height = 87
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Dados do Pedido'
      TabOrder = 1
      object lblCodigo: TLabel
        Left = 17
        Top = 21
        Width = 33
        Height = 13
        Caption = 'Codigo'
      end
      object lblDataEmissao: TLabel
        Left = 525
        Top = 21
        Width = 73
        Height = 13
        Caption = 'Data do Pedido'
      end
      object lblIDCliente: TLabel
        Left = 129
        Top = 21
        Width = 47
        Height = 13
        Caption = 'ID Cliente'
      end
      object edtNomeCliente: TEdit
        Left = 231
        Top = 40
        Width = 258
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 2
      end
      object btnPesquisaCliente: TButton
        Left = 201
        Top = 40
        Width = 24
        Height = 21
        Action = actPesquisaCliente
        TabOrder = 3
        TabStop = False
      end
      object btnPesquisaPedido: TButton
        Left = 91
        Top = 40
        Width = 24
        Height = 21
        Action = actPesquisaPedido
        TabOrder = 4
        TabStop = False
      end
      object edtCodigo: TEdit
        Left = 17
        Top = 40
        Width = 68
        Height = 21
        Enabled = False
        NumbersOnly = True
        TabOrder = 0
      end
      object edtIdCliente: TEdit
        Left = 129
        Top = 40
        Width = 68
        Height = 21
        NumbersOnly = True
        TabOrder = 1
      end
    end
    object dbgrdDadosPedido: TDBGrid
      Left = 0
      Top = 107
      Width = 958
      Height = 204
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsItemPedido
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dtpData_emissao: TDateTimePicker
    Left = 535
    Top = 111
    Width = 121
    Height = 21
    Date = 45596.000000000000000000
    Time = 0.318343194441695200
    TabOrder = 3
  end
  object QryPedido: TFDQuery
    Connection = DBConexao
    SQL.Strings = (
      'SELECT'
      'numero_pedido,'
      'data_emissao,'
      'codigo_cliente,'
      'valor_total'
      'FROM'
      'pedidos')
    Left = 764
    Top = 181
  end
  object QryItemPedido: TFDQuery
    Connection = DBConexao
    SQL.Strings = (
      'SELECT'
      'codigo,'
      'numero_pedido,'
      'codigo_produto,'
      'quantidade,'
      'valor_unitario,'
      'valor_total'
      'FROM'
      'itens_pedido'
      'WHERE'
      'numero_pedido LIKE :numero_pedido')
    Left = 864
    Top = 176
    ParamData = <
      item
        Name = 'NUMERO_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object DBConexao: TFDConnection
    Params.Strings = (
      'Password=masterkey'
      'Server=localhost'
      'User_Name=root'
      'Database=wktechbd'
      'DriverID=MySQL')
    LoginPrompt = False
    UpdateTransaction = FDTransaction
    Left = 372
    Top = 237
  end
  object FDTransaction: TFDTransaction
    Connection = DBConexao
    Left = 180
    Top = 285
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'D:\Projetos\Delphi\WKTech\lib\libmysql.dll'
    Left = 380
    Top = 309
  end
  object dsPedido: TDataSource
    DataSet = QryPedido
    Left = 768
    Top = 240
  end
  object dsItemPedido: TDataSource
    DataSet = QryItemPedido
    Left = 872
    Top = 240
  end
  object actlstPedidoVenda: TActionList
    Left = 512
    Top = 272
    object actFechar: TAction
      Category = 'Pedido'
      Caption = 'Fechar (Esc)'
      ShortCut = 27
      OnExecute = actFecharExecute
    end
    object actNovoPedido: TAction
      Category = 'Pedido'
      Caption = 'actNovoPedido'
    end
    object actEditarPedido: TAction
      Category = 'Pedido'
      Caption = 'actEditarPedido'
    end
    object actCancelarPedido: TAction
      Category = 'Pedido'
      Caption = 'actCancelarPedido'
    end
    object actNovoItem: TAction
      Category = 'ItemPedido'
      Caption = 'actItemNovo'
    end
    object actRemoverItem: TAction
      Category = 'ItemPedido'
      Caption = 'actRemoverItem'
    end
    object actGravar: TAction
      Caption = 'actGravar'
      OnExecute = actGravarExecute
    end
    object actPesquisaCliente: TAction
      Category = 'Cabecalho'
      Caption = '...'
      OnExecute = actPesquisaClienteExecute
    end
    object actPesquisaPedido: TAction
      Category = 'Cabecalho'
      Caption = '...'
      OnExecute = actPesquisaPedidoExecute
    end
  end
end
