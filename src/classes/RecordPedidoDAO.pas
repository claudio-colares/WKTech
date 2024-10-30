unit RecordPedidoDAO;

interface

uses
  RecordPedido, RecordItemPedido, System.SysUtils, FireDAC.Comp.Client;

type
  TPedidoDAO = record
  private
    Conexao: TFDConnection;
  public
    constructor Create(AConexao: TFDConnection);

    function SalvarPedido(Pedido: TPedido): Boolean;
    function ConsultarPedido(NumeroPedido: Integer): TPedido;
    function CancelarPedido(NumeroPedido: Integer): Boolean;
  end;

implementation

{ TPedidoDAO }

function TPedidoDAO.CancelarPedido(NumeroPedido: Integer): Boolean;
var
  QryPedido     :TFDQuery;
  QryPedidoItem :TFDQuery;

begin
  QryPedido := TFDQuery.Create(nil);

  try
    QryPedido.Connection     := Conexao;
    QryPedidoItem.Connection := Conexao;
    Conexao.StartTransaction;

    try

      // Deletando o pedido na tabela 'pedidos'
      QryPedidoItem.SQL.Clear;
      QryPedidoItem.SQL.Add('DELETE FROM itens_pedido WHERE numero_pedido LIKE  ' + NumeroPedido.ToString);
      QryPedidoItem.ExecSQL;


      // Deletando o pedido na tabela 'pedidos'
      QryPedido.SQL.Clear;
      QryPedido.SQL.Add('DELETE FROM pedidos WHERE numero_pedido LIKE  ' + NumeroPedido.ToString);
      QryPedido.ExecSQL;

      Conexao.Commit;
      Result := True;

    except
      on E: Exception do
      begin
       Conexao.Rollback;
       raise Exception.Create('Erro ao cancelar o pedido: '+ E.Message);
      end;

    end;

  finally
    QryPedido.Free;
    QryPedidoItem.Free;
  end;
end;

function TPedidoDAO.ConsultarPedido(NumeroPedido: Integer): TPedido;
begin
  //
end;

constructor TPedidoDAO.Create(AConexao: TFDConnection);
begin
  Conexao := AConexao;
end;

function TPedidoDAO.SalvarPedido(Pedido: TPedido): Boolean;
var
  QryPedido     : TFDQuery;
  QryPedidoItem : TFDQuery;
  Item          : TItemPedido;

begin
  Result        := False;
  QryPedido     := TFDQuery.Create(nil);
  QryPedidoItem := TFDQuery.Create(nil);

  try
    QryPedido.Connection     := Conexao;
    QryPedidoItem.Connection := Conexao;
    Conexao.StartTransaction;

    try

      //---------------------------------------------------------------------------------
      // Inserindo o pedido na tabela 'pedidos'
      //---------------------------------------------------------------------------------
      QryPedido.SQL.Clear;
      QryPedido.SQL.Text := 'INSERT INTO pedidos (data_emissao,codigo_cliente,valor_total)'+
                            ' VALUES (:data_emissao, :codigo_cliente,:valor_total)';

      QryPedido.ParamByName('data_emissao').AsDate      := Pedido.DataEmissao;
      QryPedido.ParamByName('codigo_cliente').AsInteger := Pedido.Cliente.Codigo;
      QryPedido.ParamByName('valor_total').AsCurrency   := Pedido.ValorTotal;
      QryPedido.ExecSQL;
      //---------------------------------------------------------------------------------


      //---------------------------------------------------------------------------------
      // Recuperando o numero do pedigo gerado
      //---------------------------------------------------------------------------------
      QryPedido.SQL.Clear;
      QryPedido.SQL.Text := 'SELECT LAST_INSERT_ID() AS NumeroPedido';
      QryPedido.Open;

      if not QryPedido.IsEmpty then
        Pedido.NumeroPedido := QryPedido.FieldByName('NumeroPedido').AsInteger;

      QryPedido.Close;
      //---------------------------------------------------------------------------------


      //---------------------------------------------------------------------------------
      // Inserindo os itens do pedido na tabela 'itens_pedido'
      //---------------------------------------------------------------------------------
      QryPedidoItem.SQL.Clear;
      QryPedidoItem.SQL.Text := 'INSERT INTO itens_pedido (numero_pedido, codigo_produto,quantidade,valor_unitario,valor_total)' +
                            'VALUES (:numero_pedido,:codigo_produto,:quantidade,:valor_unitario,:valor_total)';

      for Item in Pedido.Itens do
      begin
        QryPedidoItem.ParamByName('numero_pedido').AsInteger   := Pedido.NumeroPedido;
        QryPedidoItem.ParamByName('codigo_produto').AsInteger  := Item.Produto.Codigo;
        QryPedidoItem.ParamByName('quantidade').AsFloat        := Item.Quantidade;
        QryPedidoItem.ParamByName('valor_unitario').AsCurrency := Item.ValorUnitario;
        QryPedidoItem.ParamByName('valor_total').AsCurrency    := Item.Valortotal;
      end;

      // Confirmando a transacao
      Conexao.Commit;
      Result := True;


    except
      on E: Exception do
      begin
        Conexao.Rollback;
        raise Exception.Create('Erro ao salvar o pedido'+ E.Message);
      end;
    end;

  finally
    QryPedido.Free;
    QryPedidoItem.Free;
  end;
end;

end.
