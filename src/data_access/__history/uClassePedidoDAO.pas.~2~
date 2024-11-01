unit uClassePedidoDAO;

interface

uses
  uClassePedido, uClasseItemPedido, System.SysUtils, FireDAC.Comp.Client, System.Generics.Collections;

type
  TPedidoDAO = class
  private
    FConexao: TFDConnection;
  public
    constructor Create(AConexao: TFDConnection);
    function GravarPedido(Pedido: TPedido): Boolean;
    function ConsultarPedido(NumeroPedido: Integer): TPedido;
    function CancelarPedido(NumeroPedido: Integer): Boolean;
    function CarregarPedidos(NumeroPedido: Integer): TPedido;
  end;

implementation

constructor TPedidoDAO.Create(AConexao: TFDConnection);
begin
  FConexao := AConexao;
end;

function TPedidoDAO.GravarPedido(Pedido: TPedido): Boolean;
var
  QryDados: TFDQuery;
  Item: TItemPedido;
begin
  Result := False;
  QryDados := TFDQuery.Create(nil);
  try
    QryDados.Connection := FConexao;
    FConexao.StartTransaction;
    try
      // Inserindo o pedido na tabela 'pedidos'
      QryDados.SQL.Text := 'INSERT INTO pedidos (data_emissao, codigo_cliente, valor_total) VALUES (:data_emissao, :codigo_cliente, :valor_total)';
      QryDados.ParamByName('data_emissao').AsDate := Pedido.DataEmissao;
      QryDados.ParamByName('codigo_cliente').AsInteger := Pedido.Cliente.Codigo;
      QryDados.ParamByName('valor_total').AsCurrency := Pedido.ValorTotal;
      QryDados.ExecSQL;

      // Recuperando o número do pedido gerado
      QryDados.SQL.Text := 'SELECT LAST_INSERT_ID() AS NumeroPedido';
      QryDados.Open;
      if not QryDados.IsEmpty then
        Pedido.NumeroPedido := QryDados.FieldByName('NumeroPedido').AsInteger;

      // Inserindo os itens do pedido
      QryDados.SQL.Text := 'INSERT INTO itens_pedido (numero_pedido, codigo_produto, quantidade, valor_unitario, valor_total) ' +
                           'VALUES (:numero_pedido, :codigo_produto, :quantidade, :valor_unitario, :valor_total)';
      for Item in Pedido.Itens do
      begin
        QryDados.ParamByName('numero_pedido').AsInteger := Pedido.NumeroPedido;
        QryDados.ParamByName('codigo_produto').AsInteger := Item.Produto.Codigo;
        QryDados.ParamByName('quantidade').AsFloat := Item.Quantidade;
        QryDados.ParamByName('valor_unitario').AsCurrency := Item.ValorUnitario;
        QryDados.ParamByName('valor_total').AsCurrency := Item.ValorTotal;
        QryDados.ExecSQL;
      end;

      FConexao.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        FConexao.Rollback;
        raise Exception.Create('Erro ao salvar o pedido: ' + E.Message);
      end;
    end;
  finally
    QryDados.Free;
  end;
end;

function TPedidoDAO.ConsultarPedido(NumeroPedido: Integer): TPedido;
var
  QryDados: TFDQuery;
  Item: TItemPedido;
begin
  Result := TPedido.Create;
  QryDados := TFDQuery.Create(nil);
  try
    QryDados.Connection := FConexao;
    // Consulta os dados gerais do pedido
    QryDados.SQL.Text := 'SELECT numero_pedido, data_emissao, codigo_cliente, valor_total FROM pedidos WHERE numero_pedido = :numero_pedido';
    QryDados.ParamByName('numero_pedido').AsInteger := NumeroPedido;
    QryDados.Open;
    if not QryDados.IsEmpty then
    begin
      Result.NumeroPedido := QryDados.FieldByName('numero_pedido').AsInteger;
      Result.DataEmissao := QryDados.FieldByName('data_emissao').AsDateTime;
      Result.Cliente.Codigo := QryDados.FieldByName('codigo_cliente').AsInteger;
      Result.ValorTotal := QryDados.FieldByName('valor_total').AsCurrency;
    end;

    // Consulta os itens do pedido
    QryDados.SQL.Text := 'SELECT codigo, numero_pedido, codigo_produto, quantidade, valor_unitario, valor_total FROM itens_pedido WHERE numero_pedido = :numero_pedido';
    QryDados.ParamByName('numero_pedido').AsInteger := NumeroPedido;
    QryDados.Open;

    while not QryDados.Eof do
    begin
      Item := TItemPedido.Create;
      Item.Codigo := QryDados.FieldByName('codigo').AsInteger;
      Item.NumeroPedido := NumeroPedido;
      Item.Produto.Codigo := QryDados.FieldByName('codigo_produto').AsInteger;
      Item.Quantidade := QryDados.FieldByName('quantidade').AsFloat;
      Item.ValorUnitario := QryDados.FieldByName('valor_unitario').AsCurrency;
      Item.ValorTotal := QryDados.FieldByName('valor_total').AsCurrency;
      Result.Itens.Add(Item);
      QryDados.Next;
    end;
  finally
    QryDados.Free;
  end;
end;

function TPedidoDAO.CancelarPedido(NumeroPedido: Integer): Boolean;
var
  QryDados: TFDQuery;
begin
  Result := False;
  QryDados := TFDQuery.Create(nil);
  try
    QryDados.Connection := FConexao;
    FConexao.StartTransaction;
    try
      // Deletando o pedido na tabela 'itens_pedido'
      QryDados.SQL.Text := 'DELETE FROM itens_pedido WHERE numero_pedido = :numero_pedido';
      QryDados.ParamByName('numero_pedido').AsInteger := NumeroPedido;
      QryDados.ExecSQL;

      // Deletando o pedido na tabela 'pedidos'
      QryDados.SQL.Text := 'DELETE FROM pedidos WHERE numero_pedido = :numero_pedido';
      QryDados.ExecSQL;

      FConexao.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        FConexao.Rollback;
        raise Exception.Create('Erro ao cancelar o pedido: ' + E.Message);
      end;
    end;
  finally
    QryDados.Free;
  end;
end;

function TPedidoDAO.CarregarPedidos(NumeroPedido: Integer): TPedido;
begin
  Result := ConsultarPedido(NumeroPedido);
end;

end.

