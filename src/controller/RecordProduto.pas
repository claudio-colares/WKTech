unit RecordProduto;

interface

type
 TProduto = record
   Codigo     : Integer;
   Descricao  : string;
   PrecoVenda : Currency;

   procedure LimparProduto;

 end;

implementation

{ TProduto }

procedure TProduto.LimparProduto;
begin
  Codigo     := 0;
  Descricao  := '';
  PrecoVenda := 0;
end;

end.
