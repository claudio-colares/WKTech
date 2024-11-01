unit uClassePedido;

interface

uses
  System.Generics.Collections, uClasseCliente, uClasseItemPedido, SysUtils;

type
  TPedido = class
  private
    FNumeroPedido: Integer;
    FDataEmissao : TDate;
    FCliente     : TCliente;
    FItens       : TObjectList<TItemPedido>;
    FValorTotal  : Currency;


  public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionarItem(item: TItemPedido);
    procedure RemoverItem(item: TItemPedido);
    procedure AlterarItem(item: TItemPedido);
    procedure AtualizarValorTotal;
    procedure Limpar;
    property NumeroPedido: Integer read FNumeroPedido write FNumeroPedido;
    property DataEmissao: TDate read FDataEmissao write FDataEmissao;
    property Cliente: TCliente read FCliente write FCliente;
    property Itens: TObjectList<TItemPedido> read FItens write FItens;
    property ValorTotal: Currency read FValorTotal write FValorTotal;
  end;

implementation

uses uFrmPedido;

constructor TPedido.Create;
begin
  FCliente := TCliente.Create(FrmPedidoVenda.DBConexao);
  FItens   := TObjectList<TItemPedido>.Create;
end;

destructor TPedido.Destroy;
begin
  FCliente.Free;
  FItens.Free;
  inherited;
end;

procedure TPedido.AdicionarItem(item: TItemPedido);
begin
  FItens.Add(item);
  AtualizarValorTotal;
end;

procedure TPedido.AlterarItem(item: TItemPedido);
begin
  AtualizarValorTotal;
end;

procedure TPedido.AtualizarValorTotal;
var
  item: TItemPedido;
begin
  FValorTotal := 0;
  for item in FItens do
    FValorTotal := FValorTotal + item.ValorTotal;
end;

procedure TPedido.Limpar;
begin
  FNumeroPedido := 0;
  FDataEmissao  := Now;
  FValorTotal   := 0;
  FCliente.Limpar;
  FItens.Clear;
end;

procedure TPedido.RemoverItem(item: TItemPedido);
begin
  FItens.Remove(item);
  AtualizarValorTotal;
end;

end.
