inherited FrmListagemCliente: TFrmListagemCliente
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrdDados: TDBGrid
    DataSource = dsDados
  end
  inherited QryDados: TFDQuery
    Connection = FrmPedidoVenda.DBConexao
    SQL.Strings = (
      'SELECT * FROM clientes')
    Left = 240
    Top = 112
  end
  inherited dsDados: TDataSource
    DataSet = QryDados
  end
end
