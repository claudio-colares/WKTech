  {------------------------------------------+
  |  SISTEMA.........: Teste WK Technology   |
  |  LINGUAGEM/DB....: Delphi 10.4/Mysql 5.7 |
  |  ANO.............: 2024                  |
  |------------------------------------------|
  |  Programadores/autores:                  |
  |  - Claudio A. Colares                    |
  +------------------------------------------}
unit uClasseItemPedido;

interface

uses
  uClasseProduto;

type
  TItemPedido = class
  private
    FCodigo: Integer;
    FNumeroPedido: Integer;
    FProduto: TProduto;
    FQuantidade: Double;
    FValorUnitario: Currency;
    FValorTotal: Currency;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AtualizarValorTotal;
    procedure Limpar;
    property Codigo: Integer read FCodigo write FCodigo;
    property NumeroPedido: Integer read FNumeroPedido write FNumeroPedido;
    property Produto: TProduto read FProduto write FProduto;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property ValorUnitario: Currency read FValorUnitario write FValorUnitario;
    property ValorTotal: Currency read FValorTotal write FValorTotal;
  end;

implementation

constructor TItemPedido.Create;
begin
  FProduto := TProduto.Create;
end;

destructor TItemPedido.Destroy;
begin
  FProduto.Free;
  inherited;
end;

procedure TItemPedido.AtualizarValorTotal;
begin
  FValorTotal := FQuantidade * FValorUnitario;
end;

procedure TItemPedido.Limpar;
begin
  FCodigo := 0;
  FNumeroPedido := 0;
  FQuantidade := 0;
  FValorUnitario := 0;
  FValorTotal := 0;
  FProduto.LimparProduto;
end;

end.

