inherited FrmListagemCliente: TFrmListagemCliente
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTopo: TPanel
    inherited lbltitulo: TLabel
      Width = 594
      Height = 39
    end
  end
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
end