program WKTech;

uses
  Vcl.Forms,
  RecordCliente in '..\src\classes\RecordCliente.pas',
  uFrmPedido in '..\src\modulos\pedido\uFrmPedido.pas' {Form1},
  RecordProduto in '..\src\classes\RecordProduto.pas',
  RecordItemPedido in '..\src\classes\RecordItemPedido.pas',
  RecordPedido in '..\src\classes\RecordPedido.pas',
  RecordPedidoDAO in '..\src\classes\RecordPedidoDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.