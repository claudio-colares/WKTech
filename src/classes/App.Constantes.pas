unit App.Constantes;

interface

uses System.SysUtils;

var
  _EXECUTAVEL_NOME  : string;
  _PASTASISTEMA     : string;



  // --------------------------------------------------------------------
  // Banco de Dados - FireDAC (Configurações)
  // --------------------------------------------------------------------
  _DATABASE_DRIVER  : String;
  _DATABASE_HOST    : String;
  _DATABASE_NOME    : String;
  _DATABASE_PORTA   : Integer;
  _DATABASE_USUARIO : String;
  _DATABASE_SENHA   : String;
  _DATABASE_LIB     : String;
  // --------------------------------------------------------------------



  // --------------------------------------------------------------------
  // Arquivo INI para conexao
  // --------------------------------------------------------------------
  _ARQUIVO_INI     : String;
  _SECAO_SERVIDOR  : String;
  _CHAVE_BASEDADOS : String;
  _CHAVE_PORTA     : String;
  _CHAVE_USUARIO   : String;
  _CHAVE_SENHA     : String;
  _CHAVE_IPSERVIDOR: String;
  // --------------------------------------------------------------------

procedure SetConstantes;

implementation

procedure SetConstantes;
begin
  _PASTASISTEMA    := ExtractFilePath(ParamStr(0));
  _EXECUTAVEL_NOME :=  ExtractFileName(ParamStr(0));

  // --------------------------------------------------------------------
  // Arquivo INI para conexao
  // --------------------------------------------------------------------
  _ARQUIVO_INI      := _PASTASISTEMA + 'DBconfig.ini';
  _SECAO_SERVIDOR   := 'SERVIDOR';
  _CHAVE_BASEDADOS  := 'BASEDADOS';
  _CHAVE_PORTA      := 'PORTA';
  _CHAVE_USUARIO    := 'USUARIO';
  _CHAVE_SENHA      := 'SENHA';
  _CHAVE_IPSERVIDOR := 'IPDNS';
  // --------------------------------------------------------------------


  // --------------------------------------------------------------------
  // Banco de Dados - FireDAC (Configurações)
  // --------------------------------------------------------------------
  _DATABASE_DRIVER  := 'MySQL';
  _DATABASE_HOST    := 'localhost';
  _DATABASE_NOME    := 'wktechbd';
  _DATABASE_PORTA   := 3306;
  _DATABASE_USUARIO := 'root';
  _DATABASE_SENHA   := 'masterkey';
  _DATABASE_LIB     := '..\lib\libmysql.dll';
  // --------------------------------------------------------------------

end;

end.
