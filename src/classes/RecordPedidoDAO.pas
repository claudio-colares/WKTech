unit RecordPedidoDAO;

interface

uses
  RecordPedido, RecordItemPedido, System.SysUtils, FireDAC.Comp.Client,System.Generics.Collections;

type
  TPedidoDAO = record
  private
    Conexao: TFDConnection;
  public
    constructor Create(AConexao: TFDConnection);

    function GravarPedido(Pedido: TPedido): Boolean;
    function ConsultarPedido(NumeroPedido: Integer): TPedido;
    function CancelarPedido(NumeroPedido: Integer): Boolean;
    function CarregarPedidos(NumeroPedido: Integer): TPedido;
  end;

implementation

uses
  System.Classes;

{ TPedidoDAO }

constructor TPedidoDAO.Create(AConexao: TFDConnection);
begin
  Conexao := AConexao;
end;

function TPedidoDAO.CancelarPedido(NumeroPedido: Integer): Boolean;
var
  QryDados     :TFDQuery;

begin
  QryDados := TFDQuery.Create(nil);

  try
    QryDados.Connection     := Conexao;
    Conexao.StartTransaction;

    try

      // Deletando o pedido na tabela 'itens_pedidos'
      QryDados.SQL.Clear;
      QryDados.SQL.Add('DELETE FROM itens_pedido WHERE numero_pedido LIKE  ' + NumeroPedido.ToString);
      QryDados.ExecSQL;


      // Deletando o pedido na tabela 'pedidos'
      QryDados.SQL.Clear;
      QryDados.SQL.Add('DELETE FROM pedidos WHERE numero_pedido LIKE  ' + NumeroPedido.ToString);
      QryDados.ExecSQL;

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
    QryDados.Free;
  end;
end;

function TPedidoDAO.CarregarPedidos(NumeroPedido: Integer): TPedido;
var
  QryDados: TFDQuery;
  Item: TItemPedido;
begin
  // Inicializando a estrutura do pedido
  Result := Default(TPedido);
  Result.Itens := TList<TItemPedido>.Create; // Inicializa a lista de itens do pedido

  QryDados := TFDQuery.Create(nil);
  try
    QryDados.Connection := Conexao;

    // Carregando os dados gerais do pedido
    QryDados.SQL.Text := 'SELECT numero_pedido, data_emissao, codigo_cliente, valor_total ' +
                         'FROM pedidos WHERE numero_pedido = :numero_pedido';
    QryDados.ParamByName('numero_pedido').AsInteger := NumeroPedido;
    QryDados.Open;

    if not QryDados.IsEmpty then
    begin
      // Populando o pedido com os dados do banco
      Result.NumeroPedido := QryDados.FieldByName('numero_pedido').AsInteger;
      Result.DataEmissao := QryDados.FieldByName('data_emissao').AsDateTime;
      Result.Cliente.Codigo := QryDados.FieldByName('codigo_cliente').AsInteger;
      Result.ValorTotal := QryDados.FieldByName('valor_total').AsCurrency;
    end
    else
      Exit; // Pedido não encontrado, encerra a função

    QryDados.Close;

    // Carregando os itens do pedido
    QryDados.SQL.Text := 'SELECT autoincrem, codigo_produto, quantidade, valor_unitario, valor_total ' +
                         'FROM itens_pedido WHERE numero_pedido = :numero_pedido';
    QryDados.ParamByName('numero_pedido').AsInteger := NumeroPedido;
    QryDados.Open;

    while not QryDados.Eof do
    begin
      // Preenchendo os dados do item
      Item := Default(TItemPedido);
      Item.Codigo := QryDados.FieldByName('codigo').AsInteger;
      Item.NumeroPedido := NumeroPedido;
      Item.Produto.Codigo := QryDados.FieldByName('codigo_produto').AsInteger;
      Item.Quantidade := QryDados.FieldByName('quantidade').AsFloat;
      Item.ValorUnitario := QryDados.FieldByName('valor_unitario').AsCurrency;
      Item.ValorTotal := QryDados.FieldByName('valor_total').AsCurrency;

      // Adicionando o item à lista de itens do pedido
      Result.Itens.Add(Item);

      QryDados.Next;
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
  // Inicializa a estrutura do pedido
  //Result := TPedido.Create;

  QryDados := TFDQuery.Create(nil);
  try
    QryDados.Connection := Conexao;

    // Consulta os dados gerais do pedido
    QryDados.SQL.Text := 'SELECT numero_pedido, data_emissao, codigo_cliente, valor_total ' +
                         'FROM pedidos WHERE numero_pedido = :numero_pedido';
    QryDados.ParamByName('numero_pedido').AsInteger := NumeroPedido;
    QryDados.Open;

    if not QryDados.IsEmpty then
    begin
      // Preenche o pedido com os dados do banco
      Result.NumeroPedido := QryDados.FieldByName('numero_pedido').AsInteger;
      Result.DataEmissao := QryDados.FieldByName('data_emissao').AsDateTime;
      Result.Cliente.Codigo := QryDados.FieldByName('codigo_cliente').AsInteger;
      Result.ValorTotal := QryDados.FieldByName('valor_total').AsCurrency;
    end
    else
    begin
      // Se o pedido não for encontrado, libera a lista de itens e encerra
     // Result.Free;
      Exit; // Pedido não encontrado
    end;

    QryDados.Close;

    // Consulta os itens do pedido
    QryDados.SQL.Text := 'SELECT autoincrem, codigo_produto, quantidade, valor_unitario, valor_total ' +
                         'FROM itens_pedido WHERE numero_pedido = :numero_pedido';
    QryDados.ParamByName('numero_pedido').AsInteger := NumeroPedido;
    QryDados.Open;

    while not QryDados.Eof do
    begin
      // Preenche os dados do item
   //   Item := TItemPedido.Create;
      Item.Codigo := QryDados.FieldByName('codigo').AsInteger;
      Item.NumeroPedido := NumeroPedido;
      Item.Produto.Codigo := QryDados.FieldByName('codigo_produto').AsInteger;
      Item.Quantidade := QryDados.FieldByName('quantidade').AsFloat;
      Item.ValorUnitario := QryDados.FieldByName('valor_unitario').AsCurrency;
      Item.ValorTotal := QryDados.FieldByName('valor_total').AsCurrency;

      // Adiciona o item à lista de itens do pedido
      Result.Itens.Add(Item);

      QryDados.Next;
    end;

  finally
    QryDados.Free;
  end;
end;


function TPedidoDAO.GravarPedido(Pedido: TPedido): Boolean;
var
  QryDados : TFDQuery;
  Item     : TItemPedido;
begin
  Result   := False;
  QryDados := TFDQuery.Create(nil);

  try
    QryDados.Connection     := Conexao;
    Conexao.StartTransaction;

    try

      //---------------------------------------------------------------------------------
      // Inserindo o pedido na tabela 'pedidos'
      //---------------------------------------------------------------------------------
      QryDados.SQL.Clear;
      QryDados.SQL.Text := 'INSERT INTO pedidos (data_emissao,codigo_cliente,valor_total)'+
                            ' VALUES (:data_emissao, :codigo_cliente,:valor_total)';

      QryDados.ParamByName('data_emissao').AsDate      := Pedido.DataEmissao;
      QryDados.ParamByName('codigo_cliente').AsInteger := Pedido.Cliente.Codigo;
      QryDados.ParamByName('valor_total').AsCurrency   := Pedido.ValorTotal;
      QryDados.ExecSQL;
      //---------------------------------------------------------------------------------


      //---------------------------------------------------------------------------------
      // Recuperando o numero do pedigo gerado
      //---------------------------------------------------------------------------------
      QryDados.SQL.Clear;
      QryDados.SQL.Text := 'SELECT LAST_INSERT_ID() AS NumeroPedido';
      QryDados.Open;

      if not QryDados.IsEmpty then
        Pedido.NumeroPedido := QryDados.FieldByName('NumeroPedido').AsInteger;

      QryDados.Close;
      //---------------------------------------------------------------------------------


      //---------------------------------------------------------------------------------
      // Inserindo os itens do pedido na tabela 'itens_pedido'
      //---------------------------------------------------------------------------------
      QryDados.SQL.Clear;
      QryDados.SQL.Text := 'INSERT INTO itens_pedido (numero_pedido, codigo_produto,quantidade,valor_unitario,valor_total)' +
                            'VALUES (:numero_pedido,:codigo_produto,:quantidade,:valor_unitario,:valor_total)';

      for Item in Pedido.Itens do
      begin
        QryDados.ParamByName('numero_pedido').AsInteger   := Pedido.NumeroPedido;
        QryDados.ParamByName('codigo_produto').AsInteger  := Item.Produto.Codigo;
        QryDados.ParamByName('quantidade').AsFloat        := Item.Quantidade;
        QryDados.ParamByName('valor_unitario').AsCurrency := Item.ValorUnitario;
        QryDados.ParamByName('valor_total').AsCurrency    := Item.Valortotal;
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
    QryDados.Free;
  end;
end;

end.
