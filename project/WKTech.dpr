program WKTech;

uses
  Vcl.Forms,
  RecordBancoDados in '..\src\model\RecordBancoDados.pas',
  uFrmListCadastroTemplate in '..\src\view\template\uFrmListCadastroTemplate.pas' {FrmListCadastroTemplate},
  uFrmListagemCliente in '..\src\view\cliente\uFrmListagemCliente.pas' {FrmListagemCliente},
  uFrmPedido in '..\src\view\pedido\uFrmPedido.pas' {FrmPedidoVenda},
  ConfigConstantes in '..\src\constants\ConfigConstantes.pas',
  uClasseCliente in '..\src\controller\uClasseCliente.pas',
  uClasseProduto in '..\src\controller\uClasseProduto.pas',
  uClasseItemPedido in '..\src\controller\uClasseItemPedido.pas',
  uClassePedido in '..\src\controller\uClassePedido.pas',
  uClassePedidoDAO in '..\src\data_access\uClassePedidoDAO.pas',
  uFrmListagemPedido in '..\src\view\pedido\uFrmListagemPedido.pas' {FrmListagemPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPedidoVenda, FrmPedidoVenda);
  Application.CreateForm(TFrmListagemPedido, FrmListagemPedido);
  Application.Run;
end.
