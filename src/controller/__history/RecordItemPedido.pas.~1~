unit RecordItemPedido;

interface

uses
  RecordProduto;

type
  TItemPedido = record
    Codigo        : Integer;
    NumeroPedido  : Integer;
    Produto       : TProduto;
    Quantidade    : Float32;
    ValorUnitario : Currency;
    Valortotal    : Currency;

    public
      procedure AtualizarValorTotal;
      procedure LimparItemPedido;

  end;

implementation

{ TItemPedido }

procedure TItemPedido.AtualizarValorTotal;
begin
  Valortotal := (Quantidade * ValorUnitario);
end;

procedure TItemPedido.LimparItemPedido;
begin
    Codigo        := 0;
    NumeroPedido  := 0;
    Quantidade    := 0;
    ValorUnitario := 0;
    Valortotal    := 0;

    Produto.LimparProduto;
end;

end.
