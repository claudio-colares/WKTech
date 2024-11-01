unit uClasseProduto;

interface

type
  TProduto = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FPrecoVenda: Currency;
  public
    procedure LimparProduto;
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property PrecoVenda: Currency read FPrecoVenda write FPrecoVenda;
  end;

implementation

procedure TProduto.LimparProduto;
begin
  FCodigo := 0;
  FDescricao := '';
  FPrecoVenda := 0;
end;

end.

