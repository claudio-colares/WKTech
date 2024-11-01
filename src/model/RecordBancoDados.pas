  {------------------------------------------+
  |  SISTEMA.........: Teste WK Technology   |
  |  LINGUAGEM/DB....: Delphi 10.3/Mysql 5.7 |
  |  ANO.............: 2024                  |
  |------------------------------------------|
  |  Programadores/autores:                  |
  |  - Claudio A. Colares                    |
  +------------------------------------------}

unit RecordBancoDados;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  System.IniFiles,
  Data.DB,
  ConfigConstantes,
  FireDAC.Comp.Client,
  FireDAC.Phys.MySQL;

Type

  TBancoDados = Record
    DriverID: String;
    Gerenciador: String;
    BaseDados: String;
    Servidor: String;
    Porta: Integer;
    Usuario: String;
    Senha: String;

  private
  Public
    procedure Limpar;
    procedure GetDadosParametros;
    procedure VerificarINI;
    procedure GravarINI;
    procedure GetDriverLink(var aDriverLink: TFDPhysMySQLDriverLink);
    procedure GetConfigFB(var aFDConnection: TFDConnection);
  end;

implementation

{ TBancoDados }


procedure TBancoDados.Limpar;
begin
  DriverID    := '';
  Servidor    := '';
  BaseDados   := '';
  Porta       := 0;
  Usuario     := '';
  Senha       := '';
end;

procedure TBancoDados.VerificarINI;
begin
  if FileExists(_ARQUIVO_INI) = False then
  begin
    Limpar;
    GetDadosParametros;
    GravarINI;
  end;
end;

procedure TBancoDados.GetDadosParametros;
var
  IniFile: TIniFile;
begin
  Limpar;

  // --------------------------------------------------------------------
  // Parametros do Banco de Dados
  // --------------------------------------------------------------------
  try
    IniFile            := TIniFile.Create(_ARQUIVO_INI);
    _DATABASE_HOST     := IniFile.ReadString(_SECAO_SERVIDOR, _CHAVE_IPSERVIDOR, 'localhost');
    _DATABASE_PORTA    := IniFile.ReadInteger(_SECAO_SERVIDOR, _CHAVE_PORTA, 3306);
    _DATABASE_NOME     := IniFile.ReadString(_SECAO_SERVIDOR, _CHAVE_BASEDADOS, 'wktechbd');
    _DATABASE_USUARIO  := IniFile.ReadString(_SECAO_SERVIDOR, _CHAVE_USUARIO, 'root');
    _DATABASE_SENHA    := IniFile.ReadString(_SECAO_SERVIDOR, _CHAVE_SENHA, 'masterkey');
  finally
    IniFile.Free;
  end;

  DriverID    := _DATABASE_DRIVER;
  Servidor    := _DATABASE_HOST;
  BaseDados   := _DATABASE_NOME;
  Porta       := _DATABASE_PORTA;
  Usuario     := _DATABASE_USUARIO;
  Senha       := _DATABASE_SENHA;
end;

procedure TBancoDados.GravarINI;
var
  mArqINI            : TIniFile;
  mUsuarioEncripitado: string;
  mSenhaEncriptada   : String;
begin

  if FileExists(_ARQUIVO_INI) then
    DeleteFile(_ARQUIVO_INI);

  mArqINI := TIniFile.Create(_ARQUIVO_INI);
  try
    mArqINI.WriteString(_SECAO_SERVIDOR,_CHAVE_IPSERVIDOR,Servidor);
    mArqINI.WriteString(_SECAO_SERVIDOR, _CHAVE_BASEDADOS, BaseDados);
    mArqINI.WriteInteger(_SECAO_SERVIDOR, _CHAVE_PORTA, Porta);
    mArqINI.WriteString(_SECAO_SERVIDOR, _CHAVE_USUARIO, Usuario);
    mArqINI.WriteString(_SECAO_SERVIDOR, _CHAVE_SENHA, Senha);
  finally
    mArqINI.Free;
 end;
end;

procedure TBancoDados.GetConfigFB(var aFDConnection: TFDConnection);
var
  mPorta: String;
begin
  mPorta := '';
  if Porta > 0 then
    mPorta := Porta.ToString;

  if (aFDConnection = nil) then
  begin
    raise Exception.Create('Objeto TFDConnection não instanciado.');
  end;
  GetDadosParametros;
  GravarINI;

  aFDConnection.Params.Values['DriverID']  := DriverID;
  aFDConnection.Params.Values['Server']    := Servidor;
  aFDConnection.Params.Values['Database']  := BaseDados;
  aFDConnection.Params.Values['User_Name'] := Usuario;
  aFDConnection.Params.Values['Password']  := Senha;
  aFDConnection.Params.Values['Port']      := mPorta;


end;

procedure TBancoDados.GetDriverLink(var aDriverLink: TFDPhysMySQLDriverLink);
begin
  if (aDriverLink = nil) then
  begin
    raise Exception.Create('Objeto TFDPhysFBDriverLink não instanciado.');
  end;

  aDriverLink.DriverID  := _DATABASE_DRIVER;
  aDriverLink.VendorLib := _PASTASISTEMA + _DATABASE_LIB ;
end;

end.
