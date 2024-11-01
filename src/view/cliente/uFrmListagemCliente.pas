  {------------------------------------------+
  |  SISTEMA.........: Teste WK Technology   |
  |  LINGUAGEM/DB....: Delphi 10.4/Mysql 5.7 |
  |  ANO.............: 2024                  |
  |------------------------------------------|
  |  Programadores/autores:                  |
  |  - Claudio A. Colares                    |
  +------------------------------------------}
unit uFrmListagemCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmListCadastroTemplate, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmListagemCliente = class(TFrmListCadastroTemplate)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListagemCliente: TFrmListagemCliente;

implementation

uses
  uFrmPedido;

{$R *.dfm}

procedure TFrmListagemCliente.FormCreate(Sender: TObject);
begin
  inherited;
  if not QryDados.Active then
    QryDados.Active := True;
end;

end.
