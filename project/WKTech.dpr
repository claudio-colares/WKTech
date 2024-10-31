program WKTech;

uses
  Vcl.Forms,
  RecordCliente in '..\src\classes\RecordCliente.pas',
  uFrmPedido in '..\src\modulos\pedido\uFrmPedido.pas' {FrmPedidoVenda},
  RecordProduto in '..\src\classes\RecordProduto.pas',
  RecordItemPedido in '..\src\classes\RecordItemPedido.pas',
  RecordPedido in '..\src\classes\RecordPedido.pas',
  RecordPedidoDAO in '..\src\classes\RecordPedidoDAO.pas',
  RecordBancoDados in '..\src\classes\RecordBancoDados.pas',
  App.Constantes in '..\src\classes\App.Constantes.pas',
  uFrmListCadastroTemplate in '..\src\template\uFrmListCadastroTemplate.pas' {FrmListCadastroTemplate},
  uFrmListagemCliente in '..\src\modulos\uFrmListagemCliente.pas' {FrmListagemCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPedidoVenda, FrmPedidoVenda);
  Application.CreateForm(TFrmListCadastroTemplate, FrmListCadastroTemplate);
  Application.CreateForm(TFrmListagemCliente, FrmListagemCliente);
  Application.Run;
end.
