inherited FrmListagemPedido: TFrmListagemPedido
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlListTopo: TPanel
    inherited lbltitulo: TLabel
      Width = 594
      Height = 39
      Caption = 'Listagem de Pedido de Vendas'
      ExplicitWidth = 288
    end
  end
  inherited dbgrdDados: TDBGrid
    DataSource = dsDados
  end
  inherited QryDados: TFDQuery
    Connection = FrmPedidoVenda.DBConexao
    SQL.Strings = (
      'SELECT * FROM pedidos')
  end
  inherited dsDados: TDataSource
    DataSet = QryDados
  end
end
