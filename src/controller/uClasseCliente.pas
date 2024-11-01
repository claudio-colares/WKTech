  {------------------------------------------+
  |  SISTEMA.........: Teste WK Technology   |
  |  LINGUAGEM/DB....: Delphi 10.4/Mysql 5.7 |
  |  ANO.............: 2024                  |
  |------------------------------------------|
  |  Programadores/autores:                  |
  |  - Claudio A. Colares                    |
  +------------------------------------------}
unit uClasseCliente;

interface

uses
  FireDAC.Comp.Client, SysUtils;

type
  TCliente = class

  private
    FCodigo  : Integer;
    FNome    : string;
    FCidade  : string;
    FUF      : string;

    FConexao : TFDConnection;


  public
    constructor Create(AConexao: TFDConnection);
    function GetClienteByID(IDCliente: Integer): TCliente;
    procedure Limpar;


    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Cidade: string read FCidade write FCidade;
    property UF: string read FUF write FUF;
  end;

implementation

uses uFrmPedido;


constructor TCliente.Create(AConexao: TFDConnection);
begin
 FConexao := AConexao;
end;

function TCliente.GetClienteByID(IDCliente: Integer): TCliente;
var
  Cliente : TCliente;
  QryDados: TFDQuery;

begin
   Result   := nil;
   QryDados := TFDQuery.Create(nil) ;
   QryDados.Connection := FConexao;
   FConexao.StartTransaction;
  try
      QryDados.SQL.Clear;
      QryDados.SQL.Text := 'SELECT * FROM clientes WHERE codigo LIKE ' + IntToStr(IDCliente);
      QryDados.ExecSQL;

      if QryDados.IsEmpty then
      Exit;

      Limpar;
      Cliente.Codigo := QryDados.FieldByName('codigo').AsInteger;
      Cliente.Nome   := QryDados.FieldByName('nome').AsString;
      Cliente.Cidade := QryDados.FieldByName('cidade').AsString;
      Cliente.UF     := QryDados.FieldByName('uf').AsString;

  finally
     Result  := Cliente;
     Cliente.Free;
  end;

end;

procedure TCliente.Limpar;
begin
  FCodigo := 0;
  FNome   := '';
  FCidade := '';
  FUF     := '';
end;

end.
