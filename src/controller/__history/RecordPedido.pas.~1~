unit RecordPedido;

interface
 uses
 RecordCliente,RecordItemPedido,SysUtils,System.Generics.Collections;

 type
  TPedido = record
    NumeroPedido : Integer;
    DataEmissao  : TDate;
    Cliente      : TCliente;
    Itens        : TList<TItemPedido>;
    ValorTotal   : Currency;

    public
      procedure AdicionarItem(item: TItemPedido);
      procedure RemoverItem(item: TItemPedido);
      procedure AlterarItem(item: TItemPedido);
      procedure AtualizarValorTotal;
      procedure LimparItens;
  end;

implementation

{ TPedido }

procedure TPedido.AdicionarItem(item: TItemPedido);
begin
 Itens.Add(item);
 AtualizarValorTotal;
end;

procedure TPedido.AlterarItem(item: TItemPedido);
begin
 AtualizarValorTotal;
end;

procedure TPedido.AtualizarValorTotal;
var
  Item: TItemPedido;
begin
  ValorTotal := 0;
  for Item in Itens do
    ValorTotal := ValorTotal + Item.Valortotal;
end;

procedure TPedido.LimparItens;
begin
 Itens.Clear;
end;

procedure TPedido.RemoverItem(item: TItemPedido);
begin
 Itens.Remove(item);
 AtualizarValorTotal;
end;

end.
